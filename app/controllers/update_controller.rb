class UpdateController < ApplicationController
  before_filter :allow_params_authentication!
  before_filter :authenticate_registry!

  def update

    @update = params[:update]

    @feedbacks = @update[:feedbacks]
    if @feedbacks
      @feed_response = Array.new
      @feedbacks.each do |fed|
        Feedback.create(content: fed[:feedback][:content])
        id = fed[:feedback][:iOS_Key]
        @feed_response.push(id)
      end
    end

    @messages = @update[:messages]
    if @messages
      @mess_response = Array.new
      @messages.each do |fed|
        Message.create(content: fed[:message][:content], email: fed[:message][:email])
        id = fed[:message][:iOS_Key]
        @mess_response.push(id)
      end
    end

    @notifications = @update[:notifications]
    if @notifications
      @last_id = @notifications[:last_id]
      @last_update = @notifications[:last_update]
      @new_last_id = 0
      if OrgNotification.last
        @new_last_id = OrgNotification.last.id
      end
      @new_notif = OrgNotification.where('id > ? AND id <= ?',@last_id, @new_last_id)
      @new_last_update = OrgNotification.maximum(:updated_at)
      @updated_notif = OrgNotification.where('id <= ? AND ? < updated_at',@last_id,@last_update )
      @new_last_removed_id = 0
      if RemovedNotification.last
        @new_last_removed_id = RemovedNotification.last.id
      end
      @del_notif = RemovedNotification.where('id > ? AND id <= ?',@notifications[:last_removed_id], @new_last_removed_id)
    end



    respond_to do |format|
      format.json {render :file => 'update/update', :content_type => 'application/json'}
    end

  end

  def login
    @person = Person.find_all_by_email(params[:registry][:email]).first



    respond_to do |format|
      format.json { render json: @person }
    end
  end
end

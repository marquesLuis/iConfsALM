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
      @last_update = DateTime.strptime(@notifications[:last_update],'%Y-%m-%d %H:%M:%S %Z')
      @new_notif = OrgNotification.where('id > ?',@last_id)
      @updated_notif = OrgNotification.where('updated_at != ?',@last_update ).where('id <= ? AND ? < updated_at',@last_id,@last_update )
      @del_notif = RemovedNotification.where('id > ?',@notifications[:last_removed_id])
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

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
      @notif_temp = OrgNotification.last
      if @notif_temp
        @new_last_id = @notif_temp.id
      end
      @new_notif = OrgNotification.where('id > ? AND id <= ?',@last_id, @new_last_id)
      @new_last_update = OrgNotification.maximum(:updated_at)
      @updated_notif = OrgNotification.where('id <= ? AND ? < updated_at',@last_id,@last_update )
      @new_last_removed_id = 0
      @last_notif =  RemovedNotification.last
      if @last_notif
        @new_last_removed_id = @last_notif.id
      end
      @del_notif = RemovedNotification.where('id > ? AND id <= ?',@notifications[:last_removed_id], @new_last_removed_id)
    end

    @events = @update[:events]
    if @events
      @last_event_id = @events[:last_id]
      @last_event_update = @events[:last_update]
      @new_last_event_id = 0
      @event_temp = Event.last
      if @event_temp
        @new_last_event_id = @event_temp.id
      end
      @new_events = Event.where('id > ? AND id <= ?', @last_event_id, @new_last_event_id).includes(:event_group).includes(:speaker)
      @new_last_event_update = Event.maximum(:updated_at)
      @updated_events = Event.where('id <= ? AND ? < updated_at', @last_event_id, @last_event_update)
      @new_last_removed_event_id = 0
      @last_event = RemovedEvent.last
      if @last_event
        @new_last_removed_event_id = @last_event.id
      end
      @del_events = RemovedEvent.where('id > ? AND id <= ?',@events[:last_removed_id], @new_last_removed_event_id)
    end

    @networkings = @update[:networkings]
    if @networkings
      @last_network_id = @networkings[:last_id]
      @last_network_update = @networkings[:last_update]
      @new_network_last_id = 0
      @network_temp = Networking.last
      if @network_temp
        @new_network_last_id = @network_temp.id
      end
      @new_networks = Networking.where('id > ? AND id <= ?', @last_network_id, @new_network_last_id).includes(:area_of_interests)
      @new_last_network_update = Networking.maximum(:updated_at)
      @updated_network = Networking.where('id <= ? AND ? < updated_at', @last_network_id, @last_network_update).includes(:area_of_interests)
      @new_last_removed_network_id = 0
      @last_network = RemovedNetworkings.last
      if @last_network
        @new_last_removed_network_id = @last_network.id
      end
      @del_networks = RemovedNetworkings.where('id > ? AND id <= ?',@networkings[:last_removed_id], @new_last_removed_network_id)
    end

    @people = @update[:people]
    if @people
      @last_person_id = @people[:last_id]
      @last_person_update = @people[:last_update]
      @new_last_person_id = 0
      @person_tmp = Person.last
      if @person_tmp
        @new_last_person_id = @person_tmp.id
      end
      @new_people = Person.where('id > ? AND id <= ?', @last_person_id, @new_last_person_id)
      @new_last_person_update = Person.maximum(:updated_at)
      @updated_people = Person.where('id <= ? AND ? < updated_at', @last_person_id, @last_person_update)
      @new_last_people_removed_id = 1;
    end

    respond_to do |format|
      format.json {render :file => 'update/update', :content_type => 'application/json'}
    end

  end

  def login
    @person = Person.find_all_by_email(params[:registry][:email]).first
    @first_day = EventGroup.first_day
    @last_day = EventGroup.last_day


    respond_to do |format|
      format.json {render :file => 'update/login', :content_type => 'application/json'}
    end
  end
end

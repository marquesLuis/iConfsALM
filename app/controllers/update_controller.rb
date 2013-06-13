class UpdateController < ApplicationController
  before_filter :allow_params_authentication!
  before_filter :authenticate_registry!

  def update

    @update = params[:update]
    @person = current_registry.person_id

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
      @new_last_id = '0'
      @notif_temp = OrgNotification.last
      if @notif_temp
        @new_last_id = @notif_temp.id.to_s
      end
      if @last_id != @new_last_id
        @new_notif = OrgNotification.where('id > ? AND id <= ?',@last_id, @new_last_id)
      end

      @last_update = @notifications[:last_update]
      @new_last_update = OrgNotification.maximum(:updated_at)
      if @new_last_update
        @new_last_update = @new_last_update.strftime('%Y-%m-%d %H:%M:%S.%N')
        if @new_last_update != @last_update
          @updated_notif = OrgNotification.where('id <= ? AND ? < updated_at',@last_id,@last_update )
        end
      else
        @new_last_update = @last_update
      end

      @new_last_removed_id = '0'
      @last_notif_removed = @notifications[:last_removed_id]
      @last_notif =  RemovedNotification.last
      if @last_notif
        @new_last_removed_id = @last_notif.id.to_s
      end
      if @last_notif_removed != @new_last_removed_id
        @del_notif = RemovedNotification.where('id > ? AND id <= ?',@last_notif_removed, @new_last_removed_id)
      end
    end

    @events = @update[:events]
    if @events

      @last_event_id = @events[:last_id]
      @new_last_event_id = '0'
      @event_temp = Event.last
      if @event_temp
        @new_last_event_id = @event_temp.id.to_s
      end
      if @last_event_id != @new_last_event_id
        @new_events = Event.where('id > ? AND id <= ?', @last_event_id, @new_last_event_id).includes(:event_group)
        @new_events = @new_events.includes(:speaker)
        @new_events = @new_events.includes(:authors)
      end

      @last_event_update = @events[:last_update]
      @new_last_event_update = Event.maximum(:updated_at)
      if @new_last_event_update
        @new_last_event_update = @new_last_event_update.strftime('%Y-%m-%d %H:%M:%S.%N')
        if @last_event_update != @new_last_event_update
          @updated_events = Event.where('id <= ? AND ? < updated_at', @last_event_id, @last_event_update).includes(:event_group)
          @updated_events = @updated_events.includes(:speaker)
          @updated_events = @updated_events.includes(:authors)
        end
      else
        @new_last_event_update = @last_event_update
      end

      @new_last_removed_event_id = '0'
      @last_removed_event = @events[:last_removed_id]
      @last_event = RemovedEvent.last
      if @last_event
        @new_last_removed_event_id = @last_event.id.to_s
      end
      if @last_removed_event != @new_last_removed_event_id
        @del_events = RemovedEvent.where('id > ? AND id <= ?',@last_removed_event, @new_last_removed_event_id)
      end
    end

    @networkings = @update[:networkings]
    if @networkings

      @last_network_id = @networkings[:last_id]
      @new_network_last_id = '0'
      @network_temp = Networking.last
      if @network_temp
        @new_network_last_id = @network_temp.id.to_s
      end
      if @new_network_last_id != @last_network_id
        @new_networks = Networking.where('id > ? AND id <= ?', @last_network_id, @new_network_last_id).includes(:area_of_interests)
      end

      @old_last_removed_network_id = @networkings[:last_removed_id]
      @new_last_removed_network_id = '0'
      @last_network = RemovedNetworkings.last
      if @last_network
        @new_last_removed_network_id = @last_network.id.to_s
      end
      if @new_last_removed_network_id != @old_last_removed_network_id
        @del_networks = RemovedNetworkings.where('id > ? AND id <= ?',@old_last_removed_network_id, @new_last_removed_network_id)
      end
    end

    @people = @update[:people]
    if @people

      @last_person_id = @people[:last_id]
      @new_last_person_id = '0'
      @person_tmp = Person.last
      if @person_tmp
        @new_last_person_id = @person_tmp.id.to_s
      end
      if @new_last_person_id != @last_person_id
        @new_people = Person.where('id > ? AND id <= ?', @last_person_id, @new_last_person_id).includes(:infos)
        @new_people = @new_people.includes(:area_of_interests)
      end

      @last_person_update = @people[:last_update]
      @new_last_person_update = Person.maximum(:updated_at)
      if @new_last_person_update
        @new_last_person_update = @new_last_person_update.strftime('%Y-%m-%d %H:%M:%S.%N')
        if @last_person_update != @new_last_person_update
          @updated_people = Person.where('id <= ? AND ? < updated_at', @last_person_id, @last_person_update).includes(:infos)
          @updated_people = @updated_people.includes(:area_of_interests)
        end
      else
        @new_last_person_update = @last_person_update
      end
    end

    @attending = @update[:attending]
    if @attending
      @new_last_attending_id = '0'
      @all_attending = AtendingEvent.find_all_by_person_id(@person)
      if @all_attending
        @attending_temp = @all_attending.last
        if @attending_temp
          @new_last_attending_id = @attending_temp.id.to_s
          @last_attending_id = @attending[:last_id]
          if  @last_attending_id  != @new_last_attending_id
            @new_attendings =AtendingEvent.where('person_id = ? AND id > ? AND id <= ?',@person, @last_attending_id, @new_last_attending_id)
          end
        end
      end

      @new_last_removed_attending_id = '0'
      @all_attending_removed = RemovedAttendingEvent.find_all_by_person_id(@person)
      if @all_attending_removed
        @last_attending = @all_attending_removed.last
        if @last_attending
          @new_last_removed_attending_id = @last_attending.id.to_s
          @old_last_removed_attending_id = @attending[:last_removed_id]
          if @old_last_removed_attending_id !=  @new_last_removed_attending_id
            @del_attendings = @all_attending_removed.where('person_id = ? AND id > ? AND id <= ?',@person,@old_last_removed_attending_id, @new_last_removed_attending_id)
          end
        end
      end
    end


    @areas = @update[:areas]
    if @areas
      @last_areas_id = @areas[:last_id]
      @new_last_areas_id = '0'
      @areas_temp = AreaOfInterest.last
      if @areas_temp
        @new_last_areas_id = @areas_temp.id.to_s
      end
      if @last_areas_id != @new_last_areas_id
        @new_areas = AreaOfInterest.where('id > ? AND id <= ?',@last_areas_id, @new_last_areas_id)
      end

      @last_areas_update = @areas[:last_update]
      @new_last_areas_update = AreaOfInterest.maximum(:updated_at)
      if @new_last_areas_update
        @new_last_areas_update= @new_last_areas_update.strftime('%Y-%m-%d %H:%M:%S.%N')
        if @last_areas_update != @new_last_areas_update
          @updated_areas = AreaOfInterest.where('id <= ? AND ? < updated_at',@last_areas_id,@last_areas_update )
        end
      else
        @new_last_areas_update = @last_areas_update
      end

      @old_last_removed_areas_id = @areas[:last_removed_id]
      @new_last_removed_areas_id = '0'
      @last_area =  RemovedAreas.last
      if @last_area
        @new_last_removed_areas_id = @last_area.id.to_s
      end
      if @old_last_removed_areas_id != @new_last_removed_areas_id
        @del_areas = RemovedAreas.where('id > ? AND id <= ?',@old_last_removed_areas_id, @new_last_removed_areas_id)
      end
    end

    @locations = @update[:locations]
    if @locations
      @last_local_id = @locations[:last_id]
      @new_last_local_id = '0'
      @local_temp = Location.last
      if @local_temp
        @new_last_local_id = @local_temp.id.to_s
      end
      if @new_last_local_id != @last_local_id
        @new_locals = Location.where('id > ? AND id <= ?',@last_local_id, @new_last_local_id)
      end

      @new_last_local_removed_id = '0'
      @last_local_removed = @locations[:last_removed_id]
      @last_local =  RemovedLocation.last
      if @last_local
        @new_last_local_removed_id = @last_local.id.to_s
      end
      if @last_local_removed != @new_last_local_removed_id
        @del_locals = RemovedLocation.where('id > ? AND id <= ?',@last_local_removed, @new_last_local_removed_id)
      end

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

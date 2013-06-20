class UpdateController < ApplicationController
  before_filter :allow_params_authentication!
  before_filter :authenticate_registry!

  def isContact(id, otherID)
    if TradedContact.where(:requested_id => id, :requester_id => otherID).length != 0
      return 1
    else
      if TradedContact.where(:requester_id => id, :requested_id => otherID).length != 0
        return 1
      end
      return 0
    end
    return 0
  end

  def otherIsPending(id, otherID)
    pending_contact = PendingContact.where(:requested_id => id, :requester_id => otherID).first
    if pending_contact
      return pending_contact
    end
    return nil
  end

  def rejected_him(id, otherID)
    rejected_contact = RejectedContact.where(:requested_id => id, :requester_id => otherID).first
    if rejected_contact
      return rejected_contact
    end
    return nil
  end

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

    @notes = @update[:notes]
    if @notes

      new_notes_from_devise = @notes[:news]
      if new_notes_from_devise
        @notes_created = Array.new
        new_notes_from_devise.each do |note|
          note_server_id = note[:note][:server_id]
          if note_server_id == '0'
            created_note = Note.create(content: note[:note][:content], person_id: @person)
          else
            this_note = Note.find(note_server_id)
            if this_note.updated_at == note[:note][:updated]
              this_note.update_attributes(content: note[:note][:content])
              created_note = this_note
              if created_note.about_event
                created_note.about_event.destroy
              end
              if created_note.about_person
                created_note.about_person.destroy
              end
            else
              created_note = Note.create(content: '(Conflict Copy_From Mobile)'+note[:note][:content], person_id: @person)
            end
          end
          if note[:note][:about_session] != '0'
            @aboutEvent = AboutEvent.new
            @aboutEvent.event_id=Integer(note[:note][:about_session])
            @aboutEvent.note_id = created_note.id
            @aboutEvent.save
          end

          if note[:note][:about_person] != '0'
            @aboutPerson = AboutPerson.new
            @aboutPerson.person_id=Integer(note[:note][:about_person])
            @aboutPerson.note_id = created_note.id
            @aboutPerson.save
          end
          @notes_created.push(note[:note][:local_id])
        end
      end

      removed_notes_from_devise = @notes[:deleted]
      if removed_notes_from_devise
        @notes_deleted = Array.new
        removed_notes_from_devise.each_with_index do |cod, index|
          puts 'HERE'
          puts index
          puts index % 2
          if (index % 2)==0
            @notes_deleted.push(cod)
          else
            old_note = Note.find(cod)
            if old_note
              if old_note.about_event
                old_note.about_event.destroy
              end
              if old_note.about_person
                old_note.about_person.destroy
              end
              old_note.destroy
            end
          end
        end
      end

      @last_note_id = @notes[:last_id]
      @all_notes = Note.find_all_by_person_id(@person)
      if @all_notes
        @new_last_note_id = '0'
        @note_tmp = @all_notes.last
        if @note_tmp
          @new_last_note_id = @note_tmp.id.to_s
        end
        if @new_last_note_id != @last_note_id
          @new_notes = Note.where('person_id = ? AND id > ? AND id <= ?',@person,@last_note_id, @new_last_note_id)
          @new_notes = @new_notes.includes(:about_person)
          @new_notes = @new_notes.includes(:about_event)
        end

        @last_note_update = @notes[:last_update]
        @last_note_tmp =Note.where('person_id = ?',@person).last
        if @last_note_tmp
          @new_last_note_update =@last_note_tmp.updated_at.strftime('%Y-%m-%d %H:%M:%S.%N')
          if @new_last_note_update
            if @last_note_update != @new_last_note_update
              @updated_notes = Note.where('person_id = ?',@person).where('id <= ? AND ? < updated_at',@last_note_id,@last_note_update )
              @updated_notes = @updated_notes.includes(:about_person)
              @updated_notes = @updated_notes.includes(:about_event)
            end
          else
            @new_last_note_update = @last_note_update
          end
        end

      end




      @new_last_note_removed_id = '0'
      @last_note_removed = @notes[:last_removed_id]
      @all_notes_removed = RemovedNote.find_all_by_person_id(@person)
      if @all_notes_removed
        @last_note =  @all_notes_removed.last
        if @last_note
          @new_last_note_removed_id = @last_note.id.to_s
        end
        if @last_note_removed != @new_last_note_removed_id
          @del_notes = RemovedNote.where('person_id = ? AND id > ? AND id <= ?',@person,@last_note_removed, @new_last_note_removed_id)
        end
      end


      end
    my_self = Person.find(@person)
    contacts = @update[:contacts]
    if contacts
      news_contacts = contacts[:news]
      if news_contacts
        @contacts_added = Array.new
        news_contacts.each do |nc|
          TradedContact.create(requester_id: nc[:contact][:person_id], requested_id: @person)
          @contacts_added.push(nc[:contact][:person_id])
          if nc[:contact][:pending_id] != '0'
            pending = PendingContact.find(nc[:contact][:pending_id])
            if pending
              pending.destroy
            end
          else
            rejected = RejectedContact.find(nc[:contact][:rejected_id])
            if rejected
              rejected.destroy
            end
          end
        end
      end

      asked_contacts = contacts[:asked]
      if asked_contacts
        @contacts_asked = Array.new
        asked_contacts.each do |ac|
          @contacts_asked.push(ac)
          if isContact(ac, @person) == 0
            pending_contact = otherIsPending(@person, ac)
            rejected_other = rejected_him(@person, ac)
            if pending_contact.nil? && rejected_other.nil?
              rejected_me = rejected_him(ac, @person)
              if rejected_me.nil?
                PendingContact.create(requester_id: @person, requested_id: ac)
              end
            else
              pending_contact.destroy
              rejected_other.destroy
              TradedContact.create(requester_id: ac, requested_id: @person)
            end
          end
        end
      end

      rejected_contact = contacts[:rejected]
      if rejected_contact
        @rejected_contacts = Array.new
         rejected_contact.each do |rc|
           @rejected_contacts.push(rc)
           ped = PendingContact.find(rc)
           if ped
             other_id = ped.requester_id
             ped.destroy
             RejectedContact.create(requester_id: other_id, requested_id: @person)
           end
         end
      end

    end
    @traded = my_self.received_traded_contacts
    @traded2 = my_self.sent_traded_contacts
    @pending =  my_self.received_pending_requests
    @asked = my_self.sent_pending_requests
    @rejected = my_self.received_rejected_requests
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

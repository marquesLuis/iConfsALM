class UserProgramController < ApplicationController
  before_filter :authenticate_registry!

  def show_complete
    @event_groups = EventGroup.all
    @first_day = EventGroup.first_day
    @last_day = EventGroup.last_day

    @min_hour = Event.min_hour;
    @max_hour =Event.max_hour;
    @begin_year = @first_day.year;
    @begin_month = (@first_day.month) -1;
    @begin_day = @first_day.day;
    @begin_weekday = @first_day.wday;

    @attending = current_registry.person.attending_events
    attending_ids = current_registry.person.attending_events.pluck(:id)
    attending_ids<<0;
    @events = Event.where("id NOT IN (?)", attending_ids)
  end


  def index
    @event_groups = EventGroup.all
    @first_day = EventGroup.first_day
    @last_day = EventGroup.last_day

    @min_hour =8;
    @max_hour =23;
    @begin_year = @first_day.year;
    @begin_month = (@first_day.month) -1;
    @begin_day = @first_day.day;
    @begin_weekday =@first_day.wday;

    attending = current_registry.person.attending_events.pluck(:id)
    if attending.any?
      @events = Event.where('id IN (?)', attending)
    else
      @events=[]
    end

  end

  def show_event
    @event = Event.find(params[:id])
    @event_group = @event.event_group
    @location = @event.event_group.location
    @speaker = @event.speaker
    @documents = @event.documents
    @docs = @documents.pluck(:id)

    @authors = Author.where('document_id in (?)', @docs).uniq(:id)

    self_id = current_registry.person_id
    @notes =[]
    @about = @event.about_events
    if (@about.nil?)
    else
      @about.each do |a|
        if a.note.person_id == self_id
          @notes <<a.note
        end
      end
    end

    @attending = AtendingEvent.where('person_id = ? AND event_id = ?', current_registry.person_id, @event.id).first

  end

  def add_event
    @event_id = params[:id]
    @atending_event = AtendingEvent.where('person_id = ? AND event_id = ?', current_registry.person_id, @event_id)
    if @atending_event.any?
      @already_added=true
    else
      @atending_event = AtendingEvent.new(:person_id => current_registry.person_id, :event_id => @event_id)
      @atending_event.save
    end

    if params[:internal]
      @remove_button=true
    end
    respond_to do |format|
      format.js
    end
  end

  def remove_event
    @atending_event = AtendingEvent.where('person_id = ? AND event_id = ?', current_registry.person_id, params[:id]).first
    if params[:rfc]
      @remove_from_calendar=true
    end
    @event_id = params[:id]

    if @atending_event
      RemovedAttendingEvent.create(removed_event: @atending_event.id, person_id: @atending_event.person_id)
      @atending_event.destroy
    else
      @not_existing=true
    end

    if params[:internal]
      @remove_button=true
    end
    respond_to do |format|
      format.js
    end
  end


  def create_suggested

    socials = Event.where(:event_kind => 'Social Event')
    keynotes = Event.where(:event_kind => 'Keynote')
    socials.each do |event|
      AtendingEvent.create(:event_id => event.id, :person_id => current_registry.person_id)
    end
    keynotes.each do |event|
      AtendingEvent.create(:event_id => event.id, :person_id => current_registry.person_id)
    end

    respond_to do |format|
      format.html { redirect_to action: "index" }
    end
  end
end

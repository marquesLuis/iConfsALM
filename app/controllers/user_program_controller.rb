class UserProgramController < ApplicationController
  before_filter :authenticate_registry!

  def show_complete
    @event_groups = EventGroup.all
    @first_day = EventGroup.first_day
    @last_day = EventGroup.last_day

    @min_hour =8;
    @max_hour =20;
    @begin_year = @first_day.year;
    @begin_month = (@first_day.month) -1;
    @begin_day = @first_day.day;
    @begin_weekday = @first_day.wday;


    @events = Event.all
    #@grouped_by_day = []    wtf was this
    #for date in (@first_day.to_date)..(@last_day.to_date)
    #  x=[]
    #  x += EventGroup.where("date > ? AND date < ?", date, (date+1.day))
    #  @grouped_by_day.append(x)
    #end


  end

  def index
    @event_groups = EventGroup.all
    @first_day = EventGroup.first_day
    @last_day = EventGroup.last_day

    @min_hour =8;
    @max_hour =20;
    @begin_year = @first_day.year;
    @begin_month = (@first_day.month) -1;
    @begin_day = @first_day.day;
    @begin_weekday =@first_day.wday;

    attending_events = AtendingEvent.where('person_id = ?', current_registry.person_id).pluck(:event_id)
    if attending_events.any?
      @events = Event.where('id IN (?)', (attending_events))
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

  end

  def add_event

    @atending_event = AtendingEvent.where('person_id = ? AND event_id = ?', current_registry.person_id, params[:id])
    if @atending_event.any?
      @already_added=true
    else
      @atending_event = AtendingEvent.new(:person_id => current_registry.person_id, :event_id => params[:id])
      @atending_event.save

    end

    respond_to do |format|
      format.js
    end
  end

  def remove_event
    @atending_event = AtendingEvent.where('person_id = ? AND event_id = ?', current_registry.person_id, params[:id]).first
    if params[:rfc]
      @remove_from_calendar=true
      @event_id = @atending_event.event_id
    end
    if @atending_event
      RemovedAttendingEvent.create(removed_event: @atending_event.id, person_id: @atending_event.person_id)
      @atending_event.destroy

    else
      @not_existing=true
    end

    respond_to do |format|
      format.js
    end
  end
end

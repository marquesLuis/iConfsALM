class UserProgramController < ApplicationController
  before_filter :authenticate_registry!
  def show_complete
    @event_groups = EventGroup.all
    @first_day = EventGroup.first_day
    @last_day = EventGroup.last_day

    @min_hour =8;
    @max_hour =20;
    @begin_year = @first_day.year;
    @begin_month = (@first_day.month) -1 ;
    @begin_day = @first_day.day;
    @begin_weekday =@first_day.wday;

    @grouped_by_day = []
    for date in (@first_day.to_date)..(@last_day.to_date)
      x=[]
      x += EventGroup.where("date > ? AND date < ?", date, (date+1.day))
      @grouped_by_day.append(x)
    end
    @events = Event.all
  end

  def index

  end

  def show_event
    @event = Event.find(params[:id])
    @location = @event.event_group.location
    @speaker = @event.speaker
    @authors = []

    @event.documents.each do |doc|
      if doc.authors.any?
        @authors.append(doc.authors)
      end
    end

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
end

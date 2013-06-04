class RemovedEventsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /removed_events
  # GET /removed_events.json
  def index
    @removed_events = RemovedEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @removed_events }
    end
  end

  # GET /removed_events/new
  # GET /removed_events/new.json
  def new
    @removed_event = RemovedEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @removed_event }
    end
  end

  # POST /removed_events
  # POST /removed_events.json
  def create
    @removed_event = RemovedEvent.new(params[:removed_event])

    respond_to do |format|
      if @removed_event.save
        format.html { redirect_to @removed_event, notice: 'Removed event was successfully created.' }
        format.json { render json: @removed_event, status: :created, location: @removed_event }
      else
        format.html { render action: "new" }
        format.json { render json: @removed_event.errors, status: :unprocessable_entity }
      end
    end
  end
end

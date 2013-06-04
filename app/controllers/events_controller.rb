class EventsController < ApplicationController
  before_filter :authenticate_administrator!
  before_filter :get_group
  before_filter :get_docs, :only => [:new, :edit]

  def get_group
    @group = EventGroup.find(params[:event_group_id])
  end

  def get_docs
    @docs = Document.all
  end

  # GET /events
  # GET /events.json
  def index
    @events = @group.events

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = @group.events.find(params[:id])
    @self_docs = @event.documents

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = @group.events.new

    @event_docs = @event.event_documents.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = @group.events.find(params[:id])
    @event_docs = @event.event_documents.build
  end

  # POST /events
  # POST /events.json
  def create
    @event = @group.events.new(params[:event])

    params[:document][:id].each do |doc|
      if !doc.empty?
        @event.event_documents.build(:document_id => doc)
      end
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_group_event_path(@group, @event), notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = @group.events.find(params[:id])

    @event.event_documents.clear

    params[:document][:id].each do |doc|
      if !doc.empty?
        @event.event_documents.build(:document_id => doc)
      end
    end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to event_group_event_path(@group, @event), notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = @group.events.find(params[:id])
    @event.destroy
    RemovedEvent.create(event_identifier: Integer(params[:id]))

    respond_to do |format|
      format.html { redirect_to event_group_events_url(@group) }
      format.json { head :no_content }
    end
  end
end

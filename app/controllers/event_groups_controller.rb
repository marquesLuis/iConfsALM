class EventGroupsController < ApplicationController
  before_filter :authenticate_administrator!
  before_filter :get_areas, :only => [:new, :create, :update, :edit]
  before_filter :get_locations, :only => [:new, :create, :update, :edit]


  def get_areas
    @areas = AreaOfInterest.all
  end

  def get_locations
    @locations = Location.all
  end

  # GET /event_groups
  # GET /event_groups.json
  def index
    @event_groups = EventGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_groups }
    end
  end

  # GET /event_groups/1
  # GET /event_groups/1.json
  def show
    @event_group = EventGroup.find(params[:id])
    @my_areas = @event_group.area_of_interests


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_group }
    end
  end

  # GET /event_groups/new
  # GET /event_groups/new.json
  def new
    @event_group = EventGroup.new

    @group_area = @event_group.group_areas.build
    @event_group.build_location

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_group }
    end
  end

  # GET /event_groups/1/edit
  def edit
    @event_group = EventGroup.find(params[:id])
    @my_areas = @event_group.area_of_interests
    @group_area = @event_group.group_areas.build
  end

  # POST /event_groups
  # POST /event_groups.json
  def create
    @event_group = EventGroup.new(params[:event_group])

    params[:area_of_interest][:id].each do |area|
      if !area.empty?
        @event_group.group_areas.build(:area_of_interest_id => area)
      end
    end

    if !params[:location][:id].blank?
      @event_group.location = Location.find(params[:location][:id])
    end

    respond_to do |format|
      if @event_group.save
        format.html { redirect_to @event_group, notice: 'Event group was successfully created.' }
        format.json { render json: @event_group, status: :created, location: @event_group }
      else
        format.html { render action: "new" }
        format.json { render json: @event_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_groups/1
  # PUT /event_groups/1.json
  def update
    @event_group = EventGroup.find(params[:id])

    @event_group.group_areas.clear

    params[:area_of_interest][:id].each do |area|
      if !area.empty?
        @event_group.group_areas.build(:area_of_interest_id => area)
      end
    end

    if !params[:location][:id].blank?
      @event_group.location = Location.find(params[:location][:id])
    else
      @event_group.location = nil
    end

    respond_to do |format|
      if @event_group.update_attributes(params[:event_group])
        @event_group.events.each do |event|
          event.touch
        end

        format.html { redirect_to @event_group, notice: 'Event group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_groups/1
  # DELETE /event_groups/1.json
  def destroy
    @event_group = EventGroup.find(params[:id])
    @event_group.destroy

    respond_to do |format|
      format.html { redirect_to event_groups_url }
      format.json { head :no_content }
    end
  end
end
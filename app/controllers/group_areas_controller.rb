class GroupAreasController < ApplicationController
  before_filter :authenticate_administrator!
  # GET /group_areas
  # GET /group_areas.json
  def index
    @group_areas = GroupArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @group_areas }
    end
  end

  # GET /group_areas/1
  # GET /group_areas/1.json
  def show
    @group_area = GroupArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group_area }
    end
  end

  # GET /group_areas/new
  # GET /group_areas/new.json
  def new
    @group_area = GroupArea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group_area }
    end
  end

  # GET /group_areas/1/edit
  def edit
    @group_area = GroupArea.find(params[:id])
  end

  # POST /group_areas
  # POST /group_areas.json
  def create
    @group_area = GroupArea.new(params[:group_area])

    respond_to do |format|
      if @group_area.save
        format.html { redirect_to @group_area, notice: 'Group area was successfully created.' }
        format.json { render json: @group_area, status: :created, location: @group_area }
      else
        format.html { render action: "new" }
        format.json { render json: @group_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /group_areas/1
  # PUT /group_areas/1.json
  def update
    @group_area = GroupArea.find(params[:id])

    respond_to do |format|
      if @group_area.update_attributes(params[:group_area])
        format.html { redirect_to @group_area, notice: 'Group area was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_areas/1
  # DELETE /group_areas/1.json
  def destroy
    @group_area = GroupArea.find(params[:id])
    @group_area.destroy

    respond_to do |format|
      format.html { redirect_to group_areas_url }
      format.json { head :no_content }
    end
  end
end

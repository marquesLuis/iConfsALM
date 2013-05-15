class MapsVersionsController < ApplicationController
  # GET /maps_versions
  # GET /maps_versions.json
  def index
    @maps_versions = MapsVersion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maps_versions }
    end
  end

  # GET /maps_versions/1
  # GET /maps_versions/1.json
  def show
    @maps_version = MapsVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maps_version }
    end
  end

  # GET /maps_versions/new
  # GET /maps_versions/new.json
  def new
    @maps_version = MapsVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maps_version }
    end
  end

  # GET /maps_versions/1/edit
  def edit
    @maps_version = MapsVersion.find(params[:id])
  end

  # POST /maps_versions
  # POST /maps_versions.json
  def create
    @maps_version = MapsVersion.new(params[:maps_version])

    respond_to do |format|
      if @maps_version.save
        format.html { redirect_to @maps_version, notice: 'Maps version was successfully created.' }
        format.json { render json: @maps_version, status: :created, location: @maps_version }
      else
        format.html { render action: "new" }
        format.json { render json: @maps_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maps_versions/1
  # PUT /maps_versions/1.json
  def update
    @maps_version = MapsVersion.find(params[:id])

    respond_to do |format|
      if @maps_version.update_attributes(params[:maps_version])
        format.html { redirect_to @maps_version, notice: 'Maps version was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maps_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps_versions/1
  # DELETE /maps_versions/1.json
  def destroy
    @maps_version = MapsVersion.find(params[:id])
    @maps_version.destroy

    respond_to do |format|
      format.html { redirect_to maps_versions_url }
      format.json { head :no_content }
    end
  end
end

class LocationsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @mv = MapsVersion.first
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # POST /locations
  # POST /locations.json
  def create

    name = params[:upload].original_filename
    directory = 'public/images/'

    path = File.join(directory, name)
    File.open(path, 'wb') { |f| f.write(params[:upload].read) }
    @location = Location.new(:title => params[:location][:title], :image => name)
    mv = MapsVersion.first
    mv.version = mv.version+1
    mv.save
    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    File.delete('app/assets/images/'+@location.image)
    @location.destroy
    mv = MapsVersion.first
    mv.version = mv.version+1
    mv.save
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end
end

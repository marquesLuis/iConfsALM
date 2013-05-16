class AreaOfInterestsController < ApplicationController
  #TODO  before_filter :authenticate_administrator!

  # GET /area_of_interests
  # GET /area_of_interests.json
  def index
    @area_of_interests = AreaOfInterest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @area_of_interests }
    end
  end

  # GET /area_of_interests/1
  # GET /area_of_interests/1.json
  def show
    @area_of_interest = AreaOfInterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @area_of_interest }
    end
  end

  # GET /area_of_interests/new
  # GET /area_of_interests/new.json
  def new
    @area_of_interest = AreaOfInterest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @area_of_interest }
    end
  end

  # GET /area_of_interests/1/edit
  def edit
    @area_of_interest = AreaOfInterest.find(params[:id])
  end

  # POST /area_of_interests
  # POST /area_of_interests.json
  def create
    @area_of_interest = AreaOfInterest.new(params[:area_of_interest])

    respond_to do |format|
      if @area_of_interest.save
        format.html { redirect_to @area_of_interest, notice: 'Area of interest was successfully created.' }
        format.json { render json: @area_of_interest, status: :created, location: @area_of_interest }
      else
        format.html { render action: "new" }
        format.json { render json: @area_of_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /area_of_interests/1
  # PUT /area_of_interests/1.json
  def update
    @area_of_interest = AreaOfInterest.find(params[:id])

    respond_to do |format|
      if @area_of_interest.update_attributes(params[:area_of_interest])
        format.html { redirect_to @area_of_interest, notice: 'Area of interest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @area_of_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_of_interests/1
  # DELETE /area_of_interests/1.json
  def destroy
    @area_of_interest = AreaOfInterest.find(params[:id])
    @area_of_interest.destroy

    respond_to do |format|
      format.html { redirect_to area_of_interests_url }
      format.json { head :no_content }
    end
  end
end

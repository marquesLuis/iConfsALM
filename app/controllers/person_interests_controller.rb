class PersonInterestsController < ApplicationController
  # GET /person_interests
  # GET /person_interests.json
  def index
    @person_interests = PersonInterest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @person_interests }
    end
  end

  # GET /person_interests/1
  # GET /person_interests/1.json
  def show
    @person_interest = PersonInterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person_interest }
    end
  end

  # GET /person_interests/new
  # GET /person_interests/new.json
  def new
    @person_interest = PersonInterest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person_interest }
    end
  end

  # GET /person_interests/1/edit
  def edit
    @person_interest = PersonInterest.find(params[:id])
  end

  # POST /person_interests
  # POST /person_interests.json
  def create
    @person_interest = PersonInterest.new(params[:person_interest])

    respond_to do |format|
      if @person_interest.save
        format.html { redirect_to @person_interest, notice: 'Person interest was successfully created.' }
        format.json { render json: @person_interest, status: :created, location: @person_interest }
      else
        format.html { render action: "new" }
        format.json { render json: @person_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /person_interests/1
  # PUT /person_interests/1.json
  def update
    @person_interest = PersonInterest.find(params[:id])

    respond_to do |format|
      if @person_interest.update_attributes(params[:person_interest])
        format.html { redirect_to @person_interest, notice: 'Person interest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /person_interests/1
  # DELETE /person_interests/1.json
  def destroy
    @person_interest = PersonInterest.find(params[:id])
    @person_interest.destroy

    respond_to do |format|
      format.html { redirect_to person_interests_url }
      format.json { head :no_content }
    end
  end
end

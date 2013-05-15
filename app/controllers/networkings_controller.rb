class NetworkingsController < ApplicationController
  # GET /networkings
  # GET /networkings.json
  def index
    @networkings = Networking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @networkings }
    end
  end

  # GET /networkings/1
  # GET /networkings/1.json
  def show
    @networking = Networking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @networking }
    end
  end

  # GET /networkings/new
  # GET /networkings/new.json
  def new
    @networking = Networking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @networking }
    end
  end

  # GET /networkings/1/edit
  def edit
    @networking = Networking.find(params[:id])
  end

  # POST /networkings
  # POST /networkings.json
  def create
    @networking = Networking.new(params[:networking])

    respond_to do |format|
      if @networking.save
        format.html { redirect_to @networking, notice: 'Networking was successfully created.' }
        format.json { render json: @networking, status: :created, location: @networking }
      else
        format.html { render action: "new" }
        format.json { render json: @networking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /networkings/1
  # PUT /networkings/1.json
  def update
    @networking = Networking.find(params[:id])

    respond_to do |format|
      if @networking.update_attributes(params[:networking])
        format.html { redirect_to @networking, notice: 'Networking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @networking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networkings/1
  # DELETE /networkings/1.json
  def destroy
    @networking = Networking.find(params[:id])
    @networking.destroy

    respond_to do |format|
      format.html { redirect_to networkings_url }
      format.json { head :no_content }
    end
  end
end

class UserNetworkingController < ApplicationController
  before_filter :authenticate_registry!

  def index
    @areas_of_interest = AreaOfInterest.all
    @showing = Networking.all
  end

  def show_selection

  end

  def new
    @networking = Networking.new
    @areas_of_interest = AreaOfInterest.all

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @networking = Networking.new
    @networking.person_id=current_registry.person_id
    @networking.title = params[:networking][:title]
    @networking.content = params[:networking][:content]
    if @networking.save

      params[:interests].each do |interest|
        ni = NetworkingInterest.new(:networking_id => @networking.id, :area_of_interest_id => interest)
        ni.save
      end

      respond_to do |format|
        format.html { redirect_to '/user_networking/index/', notice: 'Networking was successfully created.' }
        format.json { render json: @networking, status: :created, location: @networking }
      end
    else
      format.html { render action: 'new' }
      format.json { render json: @networking.errors, status: :unprocessable_entity }
    end
  end

  def delete
    @networking = Networking.find(params[:id])
    @networking.destroy

    respond_to do |format|
      format.html { redirect_to '/user_networking/index/', notice: 'Networking was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  def show
    @networking = Networking.find(params[:id])

    respond_to do |format|
      format.js
    end

  end
end

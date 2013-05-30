class UserNetworkingController < ApplicationController
  before_filter :authenticate_registry!

  def index
    @areas_of_interest = AreaOfInterest.all
    @showing = Networking.all
  end

  def show_selection
    num = params[:selection]
    if num =='-1'
      #user preferences

      @areas = Person.find(current_registry.person_id).area_of_interests
      @rel = NetworkingInterest.where('area_of_interest_id in (?)', @areas).pluck(:networking_id)
      @showing = Networking.where('id in (?)', @rel)
      puts @areas
      puts @rel
      puts @showing

    else
      if num =='0'
        #all
        @showing = Networking.all
      else
        #selected area
        @area = AreaOfInterest.find(num);
        @showing = @area.networking
      end
    end
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
    @areas_of_interest = AreaOfInterest.all
    if @networking.save
      if params[:interests]
        params[:interests].each do |interest|
          ni = NetworkingInterest.new(:networking_id => @networking.id, :area_of_interest_id => interest)
          ni.save
        end
      end

      respond_to do |format|
        format.html { redirect_to '/user_networking/index/', notice: 'Networking was successfully created.' }
        format.json { render json: @networking, status: :created, location: @networking }

      end
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @networking.errors, status: :unprocessable_entity }
      end
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

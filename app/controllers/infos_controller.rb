class InfosController < ApplicationController
  before_filter :authenticate_registry!

  # GET /infos/new
  # GET /infos/new.json
  def new
    @info = Info.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @info }
    end
  end

  # POST /infos
  # POST /infos.json
  def create
    @info = Info.new(params[:info])

    respond_to do |format|
      if @info.save
        @info.person.touch
        format.html { redirect_to '/user_profile/show/', notice: 'Info was successfully created.' }
        format.json { render json: @info, status: :created, location: @info }
      else
        format.html { render action: "new" }
        format.json { render json: @info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /infos/1
  # DELETE /infos/1.json
  def destroy
    @info = Info.find(params[:id])
    @info.person.touch
    @info.destroy
    RemovedInfo.create(info_identifier: Integer(params[:id]))

    respond_to do |format|
      format.html { redirect_to '/user_profile/show/', notice: 'Info was successfully destroyed.'  }
      format.json { head :no_content }
    end
  end
end

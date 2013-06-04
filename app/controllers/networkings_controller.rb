class NetworkingsController < ApplicationController
  before_filter :authenticate_administrator!

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

 # DELETE /networkings/1
  # DELETE /networkings/1.json
  def destroy
    @networking = Networking.find(params[:id])
    @networking.destroy
    RemovedNetworkings.create(net_identifier: Integer(params[:id]))

    respond_to do |format|
      format.html { redirect_to networkings_url }
      format.json { head :no_content }
    end
  end
end

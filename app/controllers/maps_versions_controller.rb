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

end

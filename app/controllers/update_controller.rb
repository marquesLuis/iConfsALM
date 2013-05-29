class UpdateController < ApplicationController
  def update
  end

  def login
    puts params[:id]
    puts :id
    @registry = Registry.find(params[:id])
    respond_to do |format|
      format.json { render json: @registry }
    end
  end
end

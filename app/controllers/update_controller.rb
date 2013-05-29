class UpdateController < ApplicationController
  def update
  end

  def login
    @registry = Registry.find(1)
    respond_to do |format|
      format.json { render json: @registry }
    end
  end
end

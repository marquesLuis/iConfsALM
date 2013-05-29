class UpdateController < ApplicationController
  def update
  end

  def login
    @current_registry = current_registry
    respond_to do |format|
      format.json
    end
  end
end

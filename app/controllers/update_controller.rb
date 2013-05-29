class UpdateController < ApplicationController
  def update
  end

  def login
    respond_to do |format|
      format.json {current_registry.authentication_token}
    end
  end
end

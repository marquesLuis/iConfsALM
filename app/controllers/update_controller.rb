class UpdateController < ApplicationController
  def update
  end

  def login
    #RegistrationsController.new.create
    @registry = Registry.find_all_by_email(params[:registry][:email]).first
    puts @registry
   sign_in @registry

    respond_to do |format|
      format.json { render json: @registry }
    end
  end
end

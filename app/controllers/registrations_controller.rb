# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create

    if params[:signup_code] != nil
      @person = Person.where("signup_code = ?", params[:signup_code]).first
      build_resource(params[:registry])
      resource.person=@person

      if resource.save
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_up(resource_name, resource)
          redirect_to :back
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
          expire_session_data_after_sign_in!
          redirect_to :back
        end
      end
    else
      clean_up_passwords resource
      redirect_to :back, :notice => "Wrong input! Please confirm code and email. Email MUST be the same as the one you received the code."
    end

  end

  def update
    super
  end
end
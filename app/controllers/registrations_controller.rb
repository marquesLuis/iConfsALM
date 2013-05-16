# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create

    if params[:signup_code] != nil
      puts("AAAA")
      @person = Person.where("signup_code = ?", params[:signup_code]).first
      puts("BBBB")
      build_resource(params[:registry])
      puts("CCCC")
      resource.person=@person
      puts("DDDD")
    end

    puts("ASD")
    if resource.save
      if resource.active_for_authentication?
        puts("X")
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        redirect_to :back
      else
        puts("Y")
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        redirect_to :back
      end
    else
      puts("Z")
      clean_up_passwords resource
      redirect_to :back
    end

    puts("END")

  end

  def update
    super
  end
end
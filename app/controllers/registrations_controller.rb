# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    if params[:code]
      @code = params[:code]
      p = Person.where("signup_code = ?", params[:code]).first
      if p
        @mail = p.email
      end

    else
      @code = ""
    end

    super
  end

  def create
    flash[:notice] = ""
    if params[:signup_code]
      @person = Person.where("signup_code = ?", params[:signup_code]).first
      if @person
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
        else
          error=true
        end
      else
        error=true
      end
    else
      error=true
    end
    if error
      clean_up_passwords resource
      flash[:notice] = "Wrong input! Please confirm code and email. Email MUST be the same as the one you received the code."
      redirect_to :controller => 'registrations', :action => :new
    end

  end

  def update
    super
  end
end
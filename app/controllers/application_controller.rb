class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def after_sign_out_path_for(administrator)
    scope = Devise::Mapping.find_scope!(administrator)
    home_path = :"#{scope}admin#adminhome"
    respond_to?(home_path, true) ? send(home_path) : 'home#index'
  end
end

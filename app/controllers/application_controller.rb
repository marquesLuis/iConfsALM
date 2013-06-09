class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_theme

  def get_theme
    if current_registry
      @theme=current_registry.person.theme;
    else
      @theme=1;
    end
  end
end

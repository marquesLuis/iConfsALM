class UserController < ApplicationController
  before_filter :authenticate_registry!

  def program
  end
  def notifications
    @org_notifications = OrgNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @org_notifications }
    end
  end
end

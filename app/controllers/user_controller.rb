class UserController < ApplicationController
  before_filter :authenticate_registry!

  def maps
    @locations = Location.all
    if params[:title]
      @location = Location.find(params[:title][:locations_id])
    end
    if params[:title].nil?
      @location=Location.first
    end

    respond_to do |format|
      format.html # maps.html.erb
      format.js # maps.js.erb
      format.json { render json: @locations }
    end
  end

  def program

  end

  def organization

      @feedback = Feedback.new

  end
  def feedback

    feedback = Feedback.new(params[:feedback])
    feedback.read=false;
    feedback.save
    flash[:notice] = "Feedback has been sent!!"
    redirect_to :controller=>'user', :action => 'organization', :notice => 'Message here'

  end
  def notifications
    @org_notifications = OrgNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @org_notifications }
    end
  end
end

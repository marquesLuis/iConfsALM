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
    @orgmessage = params[:orgmessage]
    if @orgmessage
      @message = Message.new
    else
      @feedback = Feedback.new
    end

  end

  def feedback

    feedback = Feedback.new(params[:feedback])
    feedback.read=false;
    feedback.save
    flash[:notice] = "Feedback has been sent!!"
    redirect_to :controller => 'user', :action => 'organization', :notice => 'Message here'

  end

  def organization_message

    message = Message.new(params[:message])
    message.read=false;
    message.person=current_registry.person;
    message.save
    flash[:notice] = "Feedback has been sent!!"
    redirect_to :controller => 'user', :action => 'organization', :notice => 'Message here'

  end

  def notifications
    @org_notifications = OrgNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @org_notifications }
    end
  end

  def show_contacts
    #TODO
    @self = current_registry.person
    contacts1 = @self.sent_requests
    contacts2 = @self.received_requests
    @contacts = contacts1+contacts2

  end

  def show_pending_contacts
    @self = current_registry.person
  end

  def show_all_participants
    @self = current_registry.person
    @participants = Person.all
  end


  def show_participant
    @participant = Person.find(params[:id]);

    respond_to do |format|
      format.js # maps.js.erb
      format.json { render json: @locations }
    end
  end
end

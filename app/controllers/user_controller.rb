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
    @self = current_registry.person
    @contacts1 = @self.received_traded_contacts
    @contacts2 = @self.sent_traded_contacts


  end

  def show_pending_contacts
    @self = current_registry.person
    @to_accept = PendingContact.where('requested_id = ?', @self.id)
    @pending = PendingContact.where('requester_id = ?', @self.id)
    @rejected = RejectedContact.where('requester_id = ?', @self.id)

  end


  def show_rejected_contacts
    @rejected = RejectedContact.where('requested_id = ?', current_registry.person.id)
  end

  def show_all_participants
    @self = current_registry.person
    @participants = Person.where("id <> ?", @self.id)
  end


  def show_participant
    @participant = Person.find(params[:id]);

    @rejected = RejectedContact.where('requester_id = ? AND requested_id = ?', @participant.id, current_registry.person.id)

    @contact1 = TradedContact.where('requested_id = ? AND requester_id = ?', @participant.id, current_registry.person.id)
    @contact2 = TradedContact.where('requester_id = ? AND requested_id = ?', @participant.id, current_registry.person.id)

    @request_sent1 = PendingContact.where('requested_id = ? AND requester_id = ?', @participant.id, current_registry.person.id)
    @request_sent2 = PendingContact.where('requester_id = ? AND requested_id = ?', @participant.id, current_registry.person.id)
    @request_sent3 = RejectedContact.where('requested_id = ? AND requester_id = ?', @participant.id, current_registry.person.id)

    @request_accepted =  ( (@contact1.any?) or (@contact2.any?)  )
    @request_sent =  ( (@request_sent1.any?) or (@request_sent2.any?) or (@request_sent3.any?) )
    @request_rejected = @rejected.any?

    @interests = PersonInterest.where(:person_id => @participant.id)

    @infos = @participant.infos

    respond_to do |format|
      format.js
    end
  end
end

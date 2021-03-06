class UserController < ApplicationController
  before_filter :change_params, only: [:get_profile_image, :get_location_image]
  before_filter :allow_params_authentication!, only: [:get_profile_image, :get_location_image]
  before_filter :authenticate_registry!

  def change_params
    if params[:registry]
      key = '235677A81B29A981E47FB176F6C1F'
      params[:registry][:email] = AESCrypt.decrypt(params[:registry][:email], key)
      params[:registry][:password] = AESCrypt.decrypt(params[:registry][:password], key)
    end
  end

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
    redirect_to :controller => :user_program, :action => :index
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
    feedback.read=false
    feedback.save

    respond_to do |format|
      if feedback.save
        flash[:notice] = 'Feedback has been sent!!'
        format.html { render :organization }
      else
        flash[:error] = 'Message rejected.'
        format.html { render :organization }
      end
    end
  end

  def organization_message

    @message = Message.new(params[:message])
    @message.read=false

    respond_to do |format|
      if @message.save
        flash[:notice] = 'Message has been sent!!'
        format.html { render :organization }
      else
        flash[:error] = 'Message rejected.'
        @message = Message.new
        format.html { render :organization }
      end
    end
  end

  def notifications
    @org_notifications = OrgNotification.order('updated_at DESC').paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @org_notifications }
    end
  end

  def show_contacts
    @self = current_registry.person

    @pending_amount = PendingContact.where('requested_id = ?', @self.id).count

    contacts1 = @self.received_traded_contacts.pluck(:requester_id)
    contacts2 = @self.sent_traded_contacts.pluck(:requested_id)

    @contacts = Person.where('id in (?) OR id in (?)', contacts1, contacts2).paginate(:page => params[:page], :per_page => 6).order(:last_name)
  end

  def show_pending_contacts
    @self = current_registry.person
    @pending_amount = PendingContact.where('requested_id = ?', @self.id).count
    @to_accept = PendingContact.where('requested_id = ?', @self.id).paginate(:page => params[:page], :per_page => 6)
    pending = PendingContact.where('requester_id = ?', @self.id).pluck(:requested_id)
    rejected = RejectedContact.where('requester_id = ?', @self.id).pluck(:requested_id)
    @sent = Person.where('id in (?) OR id in (?)', pending, rejected).paginate(:page => params[:sent_page], :per_page => 6).order(:last_name)
  end

  def show_rejected_contacts
    @pending_amount = PendingContact.where('requested_id = ?', current_registry.person_id).count
    @rejected = RejectedContact.where('requested_id = ?', current_registry.person.id).paginate(:page => params[:page], :per_page => 6)
  end

  def show_all_participants
    @self = current_registry.person
    @pending_amount = PendingContact.where('requested_id = ?', @self.id).count
    @participants = Person.where('id <> ?', @self.id).paginate(:page => params[:page], :per_page => 6).order(:last_name)
    if params[:id]
      @person = current_registry.person
      @participant = Person.find(params[:id]);
      @rejected = RejectedContact.where('requester_id = ? AND requested_id = ?', @participant.id, @person.id)

      @contact1 = TradedContact.where('requested_id = ? AND requester_id = ?', @participant.id, @person.id)
      @contact2 = TradedContact.where('requester_id = ? AND requested_id = ?', @participant.id, @person.id)

      @request_sent1 = PendingContact.where('requested_id = ? AND requester_id = ?', @participant.id, @person.id)
      @request_sent2 = PendingContact.where('requester_id = ? AND requested_id = ?', @participant.id, @person.id)
      @request_sent3 = RejectedContact.where('requested_id = ? AND requester_id = ?', @participant.id, @person.id)

      @request_accepted = ((@contact1.any?) or (@contact2.any?))
      @request_sent = ((@request_sent1.any?) or (@request_sent2.any?) or (@request_sent3.any?))
      @request_rejected = @rejected.any?

      @interests = @participant.area_of_interests

      @infos = @participant.infos

      @notes =[]
      @about = @participant.about_persons
      @about.each do |a|
        if a.note.person_id == @person.id
          @notes <<a.note
        end
      end

      @networking = @participant.networkings.paginate(:page => params[:page], :per_page => 6)
    end

    respond_to do |format|
      format.html # maps.html.erb
    end
  end

  def show_participant
    @person = current_registry.person
    @participant = Person.find(params[:id]);

    @rejected = RejectedContact.where('requester_id = ? AND requested_id = ?', @participant.id, @person.id)

    @contact1 = TradedContact.where('requested_id = ? AND requester_id = ?', @participant.id, @person.id)
    @contact2 = TradedContact.where('requester_id = ? AND requested_id = ?', @participant.id, @person.id)

    @request_sent1 = PendingContact.where('requested_id = ? AND requester_id = ?', @participant.id, @person.id)
    @request_sent2 = PendingContact.where('requester_id = ? AND requested_id = ?', @participant.id, @person.id)
    @request_sent3 = RejectedContact.where('requested_id = ? AND requester_id = ?', @participant.id, @person.id)

    @request_accepted = ((@contact1.any?) or (@contact2.any?))
    @request_sent = ((@request_sent1.any?) or (@request_sent2.any?) or (@request_sent3.any?))
    @request_rejected = @rejected.any?

    @interests = @participant.area_of_interests

    @infos = @participant.infos

    @notes =[]
    @about = @participant.about_persons
    @about.each do |a|
      if a.note.person_id == @person.id
        @notes <<a.note
      end
    end

    @networking = @participant.networkings.paginate(:page => params[:page], :per_page => 6)

    respond_to do |format|
      format.js
    end
  end

  def download_document
    @document = Document.find(params[:document_id])
    send_file(Rails.root.join('app', 'assets', 'documents', @document.link.to_s), :filename => @document.link.to_s)
  end

  def documents
    @areas_of_interest = AreaOfInterest.all

    @per_area = []
    @areas_of_interest.each do |area|
      @per_area.append(area.get_documents)
    end

    indexes = []
    @per_area.each do |per_area|
      indexes |= per_area.map { |a| a.id }
    end

    @no_area = Document.where('id NOT IN (?)', indexes);
  end


  def get_profile_image
    send_file(Rails.root.join('app', 'assets', 'people', params[:name]))
  end

  def get_location_image
    send_file(Rails.root.join('app', 'assets', 'locations', params[:name]))
  end

end

class PeopleController < ApplicationController
  before_filter :authenticate_administrator!
  # GET /people
  # GET /people.json
  def index
    @people = Person.includes(:registry).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    @registry = Registry.where('email = ?', @person.email).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])
    @person.signup_code = SecureRandom.hex(6)

    respond_to do |format|
      if @person.save
        @person.update_attributes(:info_modification_time => @person.created_at)
        PersonMailer.send_code(@person).deliver
        format.html { redirect_to @person, notice: 'Person was successfully created. Email has been sent.' }
        format.json { render json: @person, status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])

    #Has logged once:
    @registry = @person.registry

    #Requests or data on the person:
    @notes_about = AboutPerson.where(:person_id => @person.id)
    @speaker = Speaker.where(:person_id => @person.id)
    @author = Author.where(:person_id => @person.id)
    @pending = PendingContact.where(:requested_id => @person.id)

    if ((@registry) || (@notes_about.any?) || (@speaker.any?) || (@author.any?) || (@pending.any?))
      respond_to do |format|
        format.html { redirect_to @person, :notice => "Error: person has been used." }
      end
    else
      @person.destroy
      respond_to do |format|
        format.html { redirect_to people_url, :notice => "Person deleted with success!" }
        format.json { head :no_content }
      end
    end

  end

  def send_sign_up_mail
    @person = Person.find(params[:id])
    @registry = @person.registry
    if @registry
      @sent=false
    else
      @person.signup_code = SecureRandom.hex(6)
      @person.save
      PersonMailer.send_code(@person).deliver
      @sent=true
    end
    respond_to do |format|
      @people = Person.includes(:registry).all
      format.html { render action: 'index' }
    end
  end

  def renounce_access
    @person = Person.find(params[:id])
    @registry = @person.registry
    sign_out @registry
    @registry.destroy

    @person.signup_code = SecureRandom.hex(6)
    @person.save

    respond_to do |format|
       @people = Person.includes(:registry).all
       format.html { render action: 'index' }
     end
  end
end

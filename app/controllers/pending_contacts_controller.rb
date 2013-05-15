class PendingContactsController < ApplicationController
  # GET /pending_contacts
  # GET /pending_contacts.json
  def index
    @pending_contacts = PendingContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pending_contacts }
    end
  end

  # GET /pending_contacts/1
  # GET /pending_contacts/1.json
  def show
    @pending_contact = PendingContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pending_contact }
    end
  end

  # GET /pending_contacts/new
  # GET /pending_contacts/new.json
  def new
    @pending_contact = PendingContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pending_contact }
    end
  end

  # GET /pending_contacts/1/edit
  def edit
    @pending_contact = PendingContact.find(params[:id])
  end

  # POST /pending_contacts
  # POST /pending_contacts.json
  def create
    @pending_contact = PendingContact.new(params[:pending_contact])

    respond_to do |format|
      if @pending_contact.save
        format.html { redirect_to @pending_contact, notice: 'Pending contact was successfully created.' }
        format.json { render json: @pending_contact, status: :created, location: @pending_contact }
      else
        format.html { render action: "new" }
        format.json { render json: @pending_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pending_contacts/1
  # PUT /pending_contacts/1.json
  def update
    @pending_contact = PendingContact.find(params[:id])

    respond_to do |format|
      if @pending_contact.update_attributes(params[:pending_contact])
        format.html { redirect_to @pending_contact, notice: 'Pending contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pending_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pending_contacts/1
  # DELETE /pending_contacts/1.json
  def destroy
    @pending_contact = PendingContact.find(params[:id])
    @pending_contact.destroy

    respond_to do |format|
      format.html { redirect_to pending_contacts_url }
      format.json { head :no_content }
    end
  end
end

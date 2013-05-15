class RejectedContactsController < ApplicationController
  # GET /rejected_contacts
  # GET /rejected_contacts.json
  def index
    @rejected_contacts = RejectedContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rejected_contacts }
    end
  end

  # GET /rejected_contacts/1
  # GET /rejected_contacts/1.json
  def show
    @rejected_contact = RejectedContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rejected_contact }
    end
  end

  # GET /rejected_contacts/new
  # GET /rejected_contacts/new.json
  def new
    @rejected_contact = RejectedContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rejected_contact }
    end
  end

  # GET /rejected_contacts/1/edit
  def edit
    @rejected_contact = RejectedContact.find(params[:id])
  end

  # POST /rejected_contacts
  # POST /rejected_contacts.json
  def create
    @rejected_contact = RejectedContact.new(params[:rejected_contact])

    respond_to do |format|
      if @rejected_contact.save
        format.html { redirect_to @rejected_contact, notice: 'Rejected contact was successfully created.' }
        format.json { render json: @rejected_contact, status: :created, location: @rejected_contact }
      else
        format.html { render action: "new" }
        format.json { render json: @rejected_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rejected_contacts/1
  # PUT /rejected_contacts/1.json
  def update
    @rejected_contact = RejectedContact.find(params[:id])

    respond_to do |format|
      if @rejected_contact.update_attributes(params[:rejected_contact])
        format.html { redirect_to @rejected_contact, notice: 'Rejected contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rejected_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rejected_contacts/1
  # DELETE /rejected_contacts/1.json
  def destroy
    @rejected_contact = RejectedContact.find(params[:id])
    @rejected_contact.destroy

    respond_to do |format|
      format.html { redirect_to rejected_contacts_url }
      format.json { head :no_content }
    end
  end
end

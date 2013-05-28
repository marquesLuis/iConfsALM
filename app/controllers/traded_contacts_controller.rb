class TradedContactsController < ApplicationController
  # GET /traded_contacts
  # GET /traded_contacts.json
  def index
    @traded_contacts = TradedContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @traded_contacts }
    end
  end

  # GET /traded_contacts/1
  # GET /traded_contacts/1.json
  def show
    @traded_contact = TradedContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @traded_contact }
    end
  end

  # GET /traded_contacts/new
  # GET /traded_contacts/new.json
  def new
    @traded_contact = TradedContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @traded_contact }
    end
  end

  # GET /traded_contacts/1/edit
  def edit
    @traded_contact = TradedContact.find(params[:id])
  end

  # POST /traded_contacts
  # POST /traded_contacts.json
  def create
    @traded_contact = TradedContact.new(params[:traded_contact])

    respond_to do |format|
      if @traded_contact.save
        format.html { redirect_to @traded_contact, notice: 'Traded contact was successfully created.' }
        format.json { render json: @traded_contact, status: :created, location: @traded_contact }
      else
        format.html { render action: "new" }
        format.json { render json: @traded_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /traded_contacts/1
  # PUT /traded_contacts/1.json
  def update
    @traded_contact = TradedContact.find(params[:id])

    respond_to do |format|
      if @traded_contact.update_attributes(params[:traded_contact])
        format.html { redirect_to @traded_contact, notice: 'Traded contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @traded_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /traded_contacts/1
  # DELETE /traded_contacts/1.json
  def destroy
    @traded_contact = TradedContact.find(params[:id])
    @traded_contact.destroy

    respond_to do |format|
      format.html { redirect_to traded_contacts_url }
      format.json { head :no_content }
    end
  end
end

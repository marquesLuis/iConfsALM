class EventDocumentsController < ApplicationController
  # GET /event_documents
  # GET /event_documents.json
  def index
    @event_documents = EventDocument.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_documents }
    end
  end

  # GET /event_documents/1
  # GET /event_documents/1.json
  def show
    @event_document = EventDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_document }
    end
  end

  # GET /event_documents/new
  # GET /event_documents/new.json
  def new
    @event_document = EventDocument.new
    @documents = Document.all
    @events = Event.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_document }
    end
  end

  # GET /event_documents/1/edit
  def edit
    @event_document = EventDocument.find(params[:id])
    @documents = Document.all
    @events = Event.all
  end

  # POST /event_documents
  # POST /event_documents.json
  def create
    @event_document = EventDocument.new(params[:event_document])

    respond_to do |format|
      if @event_document.save
        format.html { redirect_to @event_document, notice: 'Event document was successfully created.' }
        format.json { render json: @event_document, status: :created, location: @event_document }
      else
        format.html { render action: "new" }
        format.json { render json: @event_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_documents/1
  # PUT /event_documents/1.json
  def update
    @event_document = EventDocument.find(params[:id])

    respond_to do |format|
      if @event_document.update_attributes(params[:event_document])
        format.html { redirect_to @event_document, notice: 'Event document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_documents/1
  # DELETE /event_documents/1.json
  def destroy
    @event_document = EventDocument.find(params[:id])
    @event_document.destroy

    respond_to do |format|
      format.html { redirect_to event_documents_url }
      format.json { head :no_content }
    end
  end
end

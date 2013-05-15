class RemovedNotesController < ApplicationController
  # GET /removed_notes
  # GET /removed_notes.json
  def index
    @removed_notes = RemovedNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @removed_notes }
    end
  end

  # GET /removed_notes/1
  # GET /removed_notes/1.json
  def show
    @removed_note = RemovedNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @removed_note }
    end
  end

  # GET /removed_notes/new
  # GET /removed_notes/new.json
  def new
    @removed_note = RemovedNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @removed_note }
    end
  end

  # GET /removed_notes/1/edit
  def edit
    @removed_note = RemovedNote.find(params[:id])
  end

  # POST /removed_notes
  # POST /removed_notes.json
  def create
    @removed_note = RemovedNote.new(params[:removed_note])

    respond_to do |format|
      if @removed_note.save
        format.html { redirect_to @removed_note, notice: 'Removed note was successfully created.' }
        format.json { render json: @removed_note, status: :created, location: @removed_note }
      else
        format.html { render action: "new" }
        format.json { render json: @removed_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /removed_notes/1
  # PUT /removed_notes/1.json
  def update
    @removed_note = RemovedNote.find(params[:id])

    respond_to do |format|
      if @removed_note.update_attributes(params[:removed_note])
        format.html { redirect_to @removed_note, notice: 'Removed note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @removed_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /removed_notes/1
  # DELETE /removed_notes/1.json
  def destroy
    @removed_note = RemovedNote.find(params[:id])
    @removed_note.destroy

    respond_to do |format|
      format.html { redirect_to removed_notes_url }
      format.json { head :no_content }
    end
  end
end

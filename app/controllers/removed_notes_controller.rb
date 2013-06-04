class RemovedNotesController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /removed_notes
  # GET /removed_notes.json
  def index
    @removed_notes = RemovedNote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @removed_notes }
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
end

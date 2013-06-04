class NotesController < ApplicationController
  before_filter :authenticate_registry!
  # GET /notes
  # GET /notes.json
  def index
    @notes = current_registry.person.notes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])
    if @note.about_person
      @person = @note.about_person.person
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  def edit_on_participant
    @note = Note.find(params[:note])
    @participant = @note.about_person.person
  end

  def edit_on_event
    @note = Note.find(params[:note])
    @event = @note.about_event.event
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])

    if @note.about_person
      @aboutPerson = @note.about_person
      @aboutPerson.destroy
    end

    if @note.about_event
      @about_event = @note.about_event
      @about_event.destroy
    end


    @rn = RemovedNote.new(:sequence_number => @note.id, :person_id => @note.person_id)
    @rn.save

    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  def index_on_participant
    @participant = Person.find(params[:participant_id])
    @notes = Note.all(:conditions => {:about_person => {:person_id => params[:participant_id]}, :person_id => current_registry.person_id})
  end

  def new_on_participant
    @note = Note.new
    @participant = Person.find(params[:participant_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # POST /notes
  # POST /notes.json
  def create_on_participant
    @note = Note.new
    @note.content=params[:content]
    @note.person_id=current_registry.person_id
    respond_to do |format|
      if @note.save
        @aboutPerson = AboutPerson.new
        @aboutPerson.person_id=params[:participant_id]
        @aboutPerson.note_id=@note.id
        @aboutPerson.save
        format.html { redirect_to '/user/show_all_participants/?id='+params[:participant_id], notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_on_participant
    @note = Note.find(params[:note])
    @aboutPerson = @note.about_person
    @aboutPerson.destroy

    @rn = RemovedNote.new(:sequence_number => @note.id, :person_id => @note.person_id)
    @rn.save

    @note.destroy

    respond_to do |format|
      format.html { redirect_to '/user/show_all_participants/', notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_on_participant
    @note = Note.find(params[:note])
    @person = @note.about_person.person

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end


  def index_on_event
    @event = Event.find(params[:event_id])
    @notes = Note.all(:conditions => {:about_event => {:event_id => params[:event_id]}, :person_id => current_registry.person_id})
  end

  def new_on_event
    @note = Note.new
    @event = Event.find(params[:event_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # POST /notes
  # POST /notes.json
  def create_on_event
    @note = Note.new
    @note.content=params[:content]
    @note.person_id=current_registry.person_id
    respond_to do |format|
      if @note.save
        @aboutEvent = AboutEvent.new
        @aboutEvent.event_id=params[:event_id]
        @aboutEvent.note_id=@note.id
        @aboutEvent.save
        format.html { redirect_to '/user_program/show_event?id='+params[:event_id], notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_on_event
    @note = Note.find(params[:note])
    @aboutEvent = @note.about_event
    @event_id = @aboutEvent.event_id
    @aboutEvent.destroy

    @rn = RemovedNote.new(:sequence_number => @note.id, :person_id => @note.person_id)
    @rn.save

    @note.destroy

    respond_to do |format|
      format.html { redirect_to '/user_program/show_event?id=' +@event_id.to_s, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_on_event
    @note = Note.find(params[:note])
    @event = @note.about_event.event

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  def export
    # DONT CHANGE TO '' !!!!!!!! \r\n STOPS WORKING!!!!!!!
    @person = current_registry.person
    @notes = @person.notes

    x=""

    @notes.each do |note|
      a=''
      if note.about_person
        a+= "Person: "
        a+= note.about_person.person.prefix+ " "
        a+= note.about_person.person.first_name + " "
        a+= note.about_person.person.last_name + "\r\n"
      else
        if note.about_event
          a+= "Event: "
          a+= note.about_event.event.title + " on "
          a+= note.about_event.event.event_group.date.to_date.to_s + " at "
          a+= note.about_event.event.begin.strftime("%I:%M:%S %Z") + "\r\n"
        else
          a+= "Note\r\n"
        end
      end
      a+= "        "
      a+= "Created on: " + note.created_at.to_date.to_s + " at " + note.created_at.strftime("%I:%M:%S %Z") + "\r\n"

      a+= "        "
      a+= note.content
      x+= a+"\r\n";
    end

    send_data(x, :filename => "notes.txt")
  end
end


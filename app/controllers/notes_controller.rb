class NotesController < ApplicationController
  before_filter :authenticate_registry!
  before_filter :require_owned_note, :only => [:show, :edit, :update, :show_on_participant, :destroy, :show_on_event, :edit_on_participant, :destroy_on_event, :edit_on_event, :destroy_on_participant]

  def require_owned_note
    if params[:id]
      @note = Note.find(params[:id])
    else
      @note = Note.find(params[:note])
    end
    if @note.person_id == current_registry.person_id
      true
    else
      flash[:notice] = "You can only access your own notes!"
      redirect_to '/notes'
    end
  end


  # GET /notes
  # GET /notes.json
  def index
    @notes = current_registry.person.notes.includes(:about_person => :person).includes(:about_event => :event)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    if @note.about_person
      @person = @note.about_person.person
    end
    if @note.about_event
      @event = @note.about_event.event
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
    if @note.about_person
      @person = @note.about_person.person
    end
    if                      @note.about_event
      @event = @note.about_event.event
    end


  end

  def edit_on_participant
    @participant = @note.about_person.person
  end

  def edit_on_event
    @event = @note.about_event.event
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])
    @note.person_id=current_registry.person_id

    respond_to do |format|
      if @note.save
        id = @note.id
        if (Integer(params[:event][:id]) rescue nil)
          @aboutEvent = AboutEvent.new
          @aboutEvent.event_id=params[:event][:id]
          @aboutEvent.note_id = id
          @aboutEvent.save
        end

        if (Integer(params[:person][:id]) rescue nil)
          @aboutPerson = AboutPerson.new
          @aboutPerson.person_id=params[:person][:id]
          @aboutPerson.note_id = id
          @aboutPerson.save
        end
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
    @aboutEvent = AboutEvent.where(:note_id => params[:id]).first
    @aboutPerson = AboutPerson.where(:note_id => params[:id]).first

    if (Integer(params[:event][:id]) rescue nil)
      if @aboutEvent
        if @aboutEvent.event_id == params[:event][:id]
          #No changes.
        else
          @aboutEvent.destroy
          @aboutEvent = AboutEvent.new
          @aboutEvent.event_id=params[:event][:id]
          @aboutEvent.note_id=params[:id]
          @aboutEvent.save
        end
      else
        @aboutEvent = AboutEvent.new
        @aboutEvent.event_id=params[:event][:id]
        @aboutEvent.note_id=params[:id]
        @aboutEvent.save
      end
    else
      if @aboutEvent
        @aboutEvent.destroy
      end
    end


    if (Integer(params[:person][:id]) rescue nil)
      if @aboutPerson
        if @aboutPerson.person_id == params[:person][:id]
          #No changes.
        else
          @aboutPerson.destroy
          @aboutPerson = AboutPerson.new
          @aboutPerson.person_id=params[:person][:id]
          @aboutPerson.note_id=params[:id]
          @aboutPerson.save
        end
      else
        @aboutPerson = AboutPerson.new
        @aboutPerson.person_id=params[:person][:id]
        @aboutPerson.note_id=params[:id]
        @aboutPerson.save
      end
    else
      if @aboutPerson
        @aboutPerson.destroy
      end
    end


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

        @note = Note.new
        @participant = Person.find(params[:participant_id])
        flash[:notice] = "You can't save empty notes."
        format.html { render action: "new_on_participant" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_on_participant
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


    @person = @note.about_person.person
    if @note.about_event
      @event = @note.about_event.event
    end

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
        @note = Note.new
        @event = Event.find(params[:event_id])
        flash[:notice] = "You can't save empty notes."
        format.html { render action: "new_on_event" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_on_event
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
    if @note.about_person
      @person = @note.about_person.person
    end
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
      found = (note.about_person || note.about_event)
      found2 = (note.about_person && note.about_event)


      a="\r\n"
      if note.about_person
        a+= "Person: "
        a+= note.about_person.person.full_name + "\r\n"
      end
      if !found2
        a+= "\r\n"
      else
        a+= " & "

      end

      if note.about_event
        a+= "Event: "
        a+= note.about_event.event.title + " on "
        a+= note.about_event.event.event_group.date.to_date.to_s + " at "
        a+= note.about_event.event.begin.strftime("%I:%M %Z") + "\r\n"
      end

      if !found
        a+= "\r\nNote\r\n"
      end
      a+= "        "
      a+= "Created on: " + note.created_at.to_date.to_s + " at " + note.created_at.strftime("%I:%M %Z") + "\r\n"

      a+= "        "
      a+= note.content
      x+= a+"\r\n";
    end

    send_data(x, :filename => "notes.txt")
  end

  def export_csv
    # DONT CHANGE TO '' !!!!!!!! \r\n STOPS WORKING!!!!!!!
    @person = current_registry.person
    @notes = @person.notes

    x="Date,Content\r\n"

    @notes.each do |note|

      a= '"'+note.created_at.to_date.to_s + ":" + note.created_at.strftime("%I:%M %Z") + '",'
      found2 = (note.about_person && note.about_event)
      a+='"'
      if note.about_person
        a+= "About Person: "
        a+= note.about_person.person.full_name
      end
      if !found2
        a+= ""
      else
        a+= " & "

      end

      if note.about_event
        a+= "About Event: "
        a+= note.about_event.event.title + " on "
        a+= note.about_event.event.event_group.date.to_date.to_s + " at "
        a+= note.about_event.event.begin.strftime("%I:%M %Z")
      end

      note.content.split(/\r\n/).each do |line|
        a += " " + line
      end

      a+='"'

      x+= a+"\r\n";
    end

    send_data(x, :filename => "notes.csv")
  end

  def export_evernote
    # DONT CHANGE TO '' !!!!!!!! \r\n STOPS WORKING!!!!!!!
    @person = current_registry.person
    @notes = @person.notes

    x='<?xml version="1.0" encoding="UTF-8"?>'
    x+="\r\n"
    x+='<!DOCTYPE en-export SYSTEM "http://xml.evernote.com/pub/evernote-export3.dtd">'
    x+="\r\n"
    x+='<en-export export-date="'+Time.now.strftime("%Y%m%dT%H%M%SZ")+'" application="Evernote" version="Evernote Mac 5.1.4 (401297)">'
    x+="\r\n"

    @notes.each do |note|
      a=''
      b=''
      if note.about_person
        b+= " About Person: "
        b+= note.about_person.person.full_name
      end
      if note.about_event
        b+= " About Event: "
        b+= note.about_event.event.title + " on "
        b+= note.about_event.event.event_group.date.to_date.to_s + " at "
        b+= note.about_event.event.begin.strftime("%I:%M %Z")
      end


      #"   &quot;
  #<   &lt;
  #>   &gt;
  #&   &amp;
      #'   &apos;

      note.content.split(/\r\n/).each do |line|
        line = line.gsub(/[']/,'&apos;')
        line = line.gsub(/[<>&]/, '<' => '&lt;', '>' => '&gt;', '&'=> '&amp;')
        line = line.gsub('"', '&quot;')
        a += "<div>" + line +"</div>"
      end

      x+="<note>"
      x+="<title>DuoConfs"+b+"</title>"
      x+="<content>"
      x+='<![CDATA[<?xml version="1.0" encoding="UTF-8" standalone="no"?>'
      x+='<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">'
      x+='<en-note style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;">'
      x+=a
      x+="</en-note>"
      x+="]]>"
      x+="</content>"
      x+="<created>"+note.created_at.strftime("%Y%m%d")+"T" + note.created_at.strftime("%H%M%S") +"Z</created>"
      x+="<updated>"+note.updated_at.strftime("%Y%m%d")+"T" + note.updated_at.strftime("%H%M%S") +"Z</updated>"
      x+="<note-attributes><author>"+@person.first_name+" "+@person.last_name+"</author></note-attributes>"
      x+="</note>"
      x+="\r\n";
    end
    x+="</en-export>"

    send_data(x, :filename => "notes.enex")
  end
end


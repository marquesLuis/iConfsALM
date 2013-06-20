class UserSearchController < ApplicationController
  before_filter :authenticate_registry!

  def search
    @search = params[:q]

    if params[:person_name].nil?
      params[:person_name]=''
      params[:person_affiliation]=''
      params[:person_mail] =''
      params[:event_name] =''
      params[:event_description] =''
      params[:networking_title] =''
      params[:networking_content] =''
      params[:notes] =''
    end


    if @search.length < 3
      @search=nil
    else
      @like = '%'+params[:q].gsub(' ', '%')+'%'
      @people = Person.where("affiliation like ? OR email like ? OR first_name || last_name like ?", @like, @like, @like)

      @events = Event.where("title like ?", @like)

      @networking = Networking.where("title like ?", @like)

      @notes = Note.where("content like ? AND person_id like ?", @like, current_registry.person_id)

      @found = (@notes.any? or @networking.any? or @events.any? or @people.any?)
    end
  end

  def people_search
    @like = '%'+params[:q].gsub(' ', '%')+'%'
    if params[:advanced]
      @people = []
      if params[:person_name]=='1'
        @people |= @people = Person.where("first_name || last_name like ?", @like)
      end
      if params[:person_affiliation]=='1'
        @people |= @people = Person.where("affiliation like ?", @like)
      end
      if params[:person_mail]=='1'
        @people |= @people = Person.where("email like ?", @like)
      end
      @people = @people.paginate(:page => params[:page], :per_page => 6)
    else
      @people = Person.where("affiliation like ? OR email like ? OR first_name || last_name like ?", @like, @like, @like).paginate(:page => params[:page], :per_page => 6)
    end
  end

  def events_search
    @like = '%'+params[:q].gsub(' ', '%')+'%'
    if params[:advanced]
      @events = []
      if params[:event_name]=='1'
        @events |= Event.where("title like ?", @like)
      end
      if params[:event_description]=='1'
        @events |= Event.where("description like ?", @like)
      end
      @events = @events.paginate(:page => params[:page], :per_page => 6)
    else
      @events = Event.where("title like ?", @like).paginate(:page => params[:page], :per_page => 6)
    end
  end

  def networking_search
    @like = '%'+params[:q].gsub(' ', '%')+'%'
    if params[:advanced]
      @networking = []
      if params[:networking_title]=='1'
        @networking |= Networking.where("title like ?", @like)
      end
      if params[:networking_content]=='1'
        @networking |= Networking.where("content like ?", @like)
      end
      @networking = @networking.paginate(:page => params[:page], :per_page => 6)
    else
      @networking = Networking.where("title like ?", @like).paginate(:page => params[:page], :per_page => 6)

    end
  end

  def notes_search
    @like = '%'+params[:q].gsub(' ', '%')+'%'
    if params[:advanced]
      @notes = []
      if params[:notes]=='1'
        @notes |= Note.where("content like ?", @like)
      end
      @notes = @notes.paginate(:page => params[:page], :per_page => 6)
    else
      @notes = Note.where("content like ? AND person_id like ?", @like, current_registry.person_id).paginate(:page => params[:page], :per_page => 6)

    end
  end


  def advanced_search
    @advanced = true
    @search = params[:q]
    if @search.length < 3
      @search=nil
    else
      @like = '%'+params[:q].gsub(' ', '%')+'%'
      @people = []

      @events = []

      @networking = []

      @notes = []

      if params[:person_name]=='1'
        @people |= @people = Person.where("first_name || last_name like ?", @like)
      end
      if params[:person_affiliation]=='1'
        @people |= @people = Person.where("affiliation like ?", @like)
      end
      if params[:person_mail]=='1'
        @people |= @people = Person.where("email like ?", @like)
      end

      if params[:event_name]=='1'
        @events |= Event.where("title like ?", @like)
      end
      if params[:event_description]=='1'
        @events |= Event.where("description like ?", @like)
      end

      if params[:networking_title]=='1'
        @networking |= Networking.where("title like ?", @like)
      end
      if params[:networking_content]=='1'
        @networking |= Networking.where("content like ?", @like)
      end

      if params[:notes]=='1'
        @notes |= Note.where("content like ? AND person_id like ?", @like, current_registry.person_id)
      end

      @found = (@notes.any? or @networking.any? or @events.any? or @people.any?)
    end

    respond_to do |format|
      format.html { render :search }
    end
  end

end

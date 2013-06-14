class UserSearchController < ApplicationController
  before_filter :authenticate_registry!

  def search
    @search = params[:q]
    if @search.length < 3
      @search=nil
    else
      @like = '%'+params[:q]+'%'
      @people = Person.where("affiliation like ? OR email like ? OR first_name like ? OR last_name like ? OR first_name || ' ' || last_name like ?", @like, @like, @like, @like, @like)

      @events = Event.where("title like ?", @like)

      @networking = Networking.where("title like ?", @like)

      @notes = Note.where("content like ?", @like)

      @found = (@notes.any? or @networking.any? or @events.any? or @people.any?)
    end
  end

  def people_search
    @like = '%'+params[:q]+'%'
    @people = Person.where("affiliation like ? OR email like ? OR first_name like ? OR last_name like ? OR first_name || ' ' || last_name like ?", @like, @like, @like, @like, @like).paginate(:page => params[:page], :per_page => 6)
  end

  def events_search
    @like = '%'+params[:q]+'%'
    @events = Event.where("title like ?", @like).paginate(:page => params[:page], :per_page => 6)
  end

  def networking_search
    @like = '%'+params[:q]+'%'
    @networking = Networking.where("title like ?", @like).paginate(:page => params[:page], :per_page => 6)

  end

  def notes_search
    @like = '%'+params[:q]+'%'
    @notes = Note.where("content like ?", @like).paginate(:page => params[:page], :per_page => 6)

  end
end

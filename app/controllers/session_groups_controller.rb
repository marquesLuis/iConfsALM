class SessionGroupsController < ApplicationController
  # GET /session_groups
  # GET /session_groups.json
  def index
    @session_groups = SessionGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @session_groups }
    end
  end

  # GET /session_groups/1
  # GET /session_groups/1.json
  def show
    @session_group = SessionGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session_group }
    end
  end

  # GET /session_groups/new
  # GET /session_groups/new.json
  def new
    @session_group = SessionGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session_group }
    end
  end

  # GET /session_groups/1/edit
  def edit
    @session_group = SessionGroup.find(params[:id])
  end

  # POST /session_groups
  # POST /session_groups.json
  def create
    @session_group = SessionGroup.new(params[:session_group])

    respond_to do |format|
      if @session_group.save
        format.html { redirect_to @session_group, notice: 'Session group was successfully created.' }
        format.json { render json: @session_group, status: :created, location: @session_group }
      else
        format.html { render action: "new" }
        format.json { render json: @session_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /session_groups/1
  # PUT /session_groups/1.json
  def update
    @session_group = SessionGroup.find(params[:id])

    respond_to do |format|
      if @session_group.update_attributes(params[:session_group])
        format.html { redirect_to @session_group, notice: 'Session group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @session_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_groups/1
  # DELETE /session_groups/1.json
  def destroy
    @session_group = SessionGroup.find(params[:id])
    @session_group.destroy

    respond_to do |format|
      format.html { redirect_to session_groups_url }
      format.json { head :no_content }
    end
  end
end

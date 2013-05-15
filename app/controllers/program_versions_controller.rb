class ProgramVersionsController < ApplicationController
  # GET /program_versions
  # GET /program_versions.json
  def index
    @program_versions = ProgramVersion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @program_versions }
    end
  end

  # GET /program_versions/1
  # GET /program_versions/1.json
  def show
    @program_version = ProgramVersion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @program_version }
    end
  end

  # GET /program_versions/new
  # GET /program_versions/new.json
  def new
    @program_version = ProgramVersion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @program_version }
    end
  end

  # GET /program_versions/1/edit
  def edit
    @program_version = ProgramVersion.find(params[:id])
  end

  # POST /program_versions
  # POST /program_versions.json
  def create
    @program_version = ProgramVersion.new(params[:program_version])

    respond_to do |format|
      if @program_version.save
        format.html { redirect_to @program_version, notice: 'Program version was successfully created.' }
        format.json { render json: @program_version, status: :created, location: @program_version }
      else
        format.html { render action: "new" }
        format.json { render json: @program_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /program_versions/1
  # PUT /program_versions/1.json
  def update
    @program_version = ProgramVersion.find(params[:id])

    respond_to do |format|
      if @program_version.update_attributes(params[:program_version])
        format.html { redirect_to @program_version, notice: 'Program version was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @program_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /program_versions/1
  # DELETE /program_versions/1.json
  def destroy
    @program_version = ProgramVersion.find(params[:id])
    @program_version.destroy

    respond_to do |format|
      format.html { redirect_to program_versions_url }
      format.json { head :no_content }
    end
  end
end

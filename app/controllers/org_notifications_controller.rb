class OrgNotificationsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /org_notifications
  # GET /org_notifications.json
  def index
    @org_notifications = OrgNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @org_notifications }
    end
  end

  # GET /org_notifications/1
  # GET /org_notifications/1.json
  def show
    @org_notification = OrgNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @org_notification }
    end
  end

  # GET /org_notifications/new
  # GET /org_notifications/new.json
  def new
    @org_notification = OrgNotification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @org_notification }
    end
  end

  # GET /org_notifications/1/edit
  def edit
    @org_notification = OrgNotification.find(params[:id])
  end

  # POST /org_notifications
  # POST /org_notifications.json
  def create
    @org_notification = OrgNotification.new(params[:org_notification])

    respond_to do |format|
      if @org_notification.save
        format.html { redirect_to @org_notification, notice: 'Org notification was successfully created.' }
        format.json { render json: @org_notification, status: :created, location: @org_notification }
      else
        format.html { render action: "new" }
        format.json { render json: @org_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /org_notifications/1
  # PUT /org_notifications/1.json
  def update
    @org_notification = OrgNotification.find(params[:id])

    respond_to do |format|
      if @org_notification.update_attributes(params[:org_notification])
        format.html { redirect_to @org_notification, notice: 'Org notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @org_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /org_notifications/1
  # DELETE /org_notifications/1.json
  def destroy
    @org_notification = OrgNotification.find(params[:id])
    @org_notification.destroy
    RemovedNotification.create(sequence_number: Integer(params[:id]))

    respond_to do |format|
      format.html { redirect_to org_notifications_url }
      format.json { head :no_content }
    end
  end
end

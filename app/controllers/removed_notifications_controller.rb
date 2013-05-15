class RemovedNotificationsController < ApplicationController
  # GET /removed_notifications
  # GET /removed_notifications.json
  def index
    @removed_notifications = RemovedNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @removed_notifications }
    end
  end

  # GET /removed_notifications/1
  # GET /removed_notifications/1.json
  def show
    @removed_notification = RemovedNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @removed_notification }
    end
  end

  # GET /removed_notifications/new
  # GET /removed_notifications/new.json
  def new
    @removed_notification = RemovedNotification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @removed_notification }
    end
  end

  # GET /removed_notifications/1/edit
  def edit
    @removed_notification = RemovedNotification.find(params[:id])
  end

  # POST /removed_notifications
  # POST /removed_notifications.json
  def create
    @removed_notification = RemovedNotification.new(params[:removed_notification])

    respond_to do |format|
      if @removed_notification.save
        format.html { redirect_to @removed_notification, notice: 'Removed notification was successfully created.' }
        format.json { render json: @removed_notification, status: :created, location: @removed_notification }
      else
        format.html { render action: "new" }
        format.json { render json: @removed_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /removed_notifications/1
  # PUT /removed_notifications/1.json
  def update
    @removed_notification = RemovedNotification.find(params[:id])

    respond_to do |format|
      if @removed_notification.update_attributes(params[:removed_notification])
        format.html { redirect_to @removed_notification, notice: 'Removed notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @removed_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /removed_notifications/1
  # DELETE /removed_notifications/1.json
  def destroy
    @removed_notification = RemovedNotification.find(params[:id])
    @removed_notification.destroy

    respond_to do |format|
      format.html { redirect_to removed_notifications_url }
      format.json { head :no_content }
    end
  end
end

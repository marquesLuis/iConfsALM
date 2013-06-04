class RemovedNotificationsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /removed_notifications
  # GET /removed_notifications.json
  def index
    @removed_notifications = RemovedNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @removed_notifications }
    end
  end

  # GET /removed_notifications/new
  # GET /removed_notifications/new.json
  def new
    @removed_notification = RemovedNotification.new
  end

  # POST /removed_notifications
  # POST /removed_notifications.json
  def create
    @removed_notification = RemovedNotification.new(params[:removed_notification])
    @removed_notification.save
  end
end

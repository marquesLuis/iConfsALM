class UserNotesController < ApplicationController
  before_filter :authenticate_registry!
  def show_all
  end
end

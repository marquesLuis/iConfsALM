class SingupController < ApplicationController
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end
  # POST /signup
  def do
    @person = Person.where("signup_code = ?", params[:signup_code]).first
    respond_to do |format|
      format.js # do.js.erb
    end
  end
end

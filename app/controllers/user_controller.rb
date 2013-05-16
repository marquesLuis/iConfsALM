class UserController < ApplicationController
  before_filter :authenticate_registry!

  def program
  end
end

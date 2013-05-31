class UpdateController < ApplicationController
  before_filter :allow_params_authentication!
  before_filter :authenticate_registry!

  def update

    @update = params[:update]

    @feedbacks = @update[:feedbacks]
    @feedbacks.each do |fed|
      Feedback.create(content: fed[:feedback][:content])
     end

  end

  def login
    @person = Person.find_all_by_email(params[:registry][:email]).first



    respond_to do |format|
      format.json { render json: @person }
    end
  end
end

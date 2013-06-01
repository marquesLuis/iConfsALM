class UpdateController < ApplicationController
  before_filter :allow_params_authentication!
  before_filter :authenticate_registry!

  def update

    @update = params[:update]

    @feedbacks = @update[:feedbacks]
    if @feedbacks
      @feed_response = Array.new
      @feedbacks.each do |fed|
        Feedback.create(content: fed[:feedback][:content])
        id = fed[:feedback][:iOS_Key]
        @feed_response.push(id)
      end
    end



    respond_to do |format|
      format.json {render :file => 'update/update', :content_type => 'application/json'}
    end

  end

  def login
    @person = Person.find_all_by_email(params[:registry][:email]).first



    respond_to do |format|
      format.json { render json: @person }
    end
  end
end

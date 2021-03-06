class FeedbacksController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    if params[:read].nil?
      @feedbacks = Feedback.all
    else
      if params[:read]=='false'
        @feedbacks = Feedback.where('read <> ?', true)
      else
        @feedbacks = Feedback.where('read = ?', true)
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = Feedback.find(params[:id])
    @feedback.update_attributes(:read => true)
    @feedback.save

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback }
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :no_content }
    end
  end
end

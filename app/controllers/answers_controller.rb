class AnswersController < ApplicationController



  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def upload
    @answer = Answer.create(params[:answer])
    if @answer
      @upload_info = Answer.token_form(params[:answer], answers_path)
    end
  end

  def save_video
  end

  def show
  end

end

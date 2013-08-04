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
      @upload_info = Answer.token_form(params[:answer], save_video_new_answer_url(:answer_id => @answer.id))
    end

  end

  def save_video
    @answer = Answer.find(params[:answer_id])
    @answer.update_attributes(:video => params[:id].to_s)
    redirect_to answers_path, :notice => "video successfully submitted"
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @answer.delete
    redirect_to answers_path
  end

end

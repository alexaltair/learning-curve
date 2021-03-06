class AnswersController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def new
    @answer = Answer.new
  end

  def upload
    question = Question.find(params[:answer].delete(:question_id))
    @answer = question.answers.build(params[:answer])

    if @answer.save
      @upload_info = Answer.token_form(params[:answer], save_video_new_answer_url(:answer_id => @answer.id))
    end
  end

  def save_video
    @answer = Answer.find(params[:answer_id])
    @answer.update_attributes(:video => params[:id].to_s, :user => current_user)
    redirect_to "/questions/#{@answer.question_id}", :notice => "video successfully submitted"
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

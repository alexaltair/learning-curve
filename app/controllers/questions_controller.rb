class QuestionsController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index, :about]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers

    @answer = Answer.new
    @answer.question = @question



  end


  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user

    if @question.save
      flash[:notice] = "The question was successfully posted"
      redirect_to '/questions'
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    render :show
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to :index
  end

  def about
  end

end
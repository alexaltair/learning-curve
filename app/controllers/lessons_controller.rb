class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      redirect_to @lesson
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

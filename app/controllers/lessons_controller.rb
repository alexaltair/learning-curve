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

  def upload
    @lesson = Lesson.create(params[:lesson])

    if @lesson
      @upload_info = Lesson.token_form(params[:lesson], save_video_new_lesson_url(:lesson_id => @lesson.id))
    end
  end

  def save_video
    @lesson = Lesson.find(params[:lesson_id])
    @lesson.update_attributes(:video => params[:id].to_s)
    binding.pry
    redirect_to "/lessons/#{@lesson.id}", :notice => "video successfully submitted"
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

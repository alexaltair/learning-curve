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
    redirect_to "/lessons/#{@lesson.id}", :notice => "video successfully submitted"
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update_attributes(params[:lesson])
    render :show
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.delete
    redirect_to lessons_path
  end

end

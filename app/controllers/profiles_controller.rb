class ProfilesController < ApplicationController
  def show
    @user = User.find_by_id(params[:id])
    if @user
      @answers = @user.answers
      @questions = @user.questions
      @lessons = @user.lessons
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end

  end
end

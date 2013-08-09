class SearchesController < ApplicationController
  def index
    @answerResults = Search.searchAnswers(params[:search])
    @questionResults = Search.searchQuestions(params[:search])
    @lessonResults = Search.searchLessons(params[:search])
  end
end

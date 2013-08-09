class VotesController < ApplicationController

  def from_button
    if user_signed_in?
      vote = Vote.where( :user_id => current_user.id,
                         :votable_id => params[:votable_id],
                         :votable_type => params[:votable_type]
                        )
      if params[:button] == 'up'
        update_vote(vote, 1, params)
      elsif params[:button] == 'down'
        update_vote(vote, -1, params)
      else raise "Vote button is neither up or down."
      end
    else
      flash[:notice] = "Must be signed in to vote."
      redirect_to Rails.application.routes.recognize_path(request.referer)
    end
  end

  def update_vote(vote, amount, params)
    if vote.length == 0
      create(:direction => amount, :votable_id => params[:votable_id], :votable_type => params[:votable_type])
    elsif vote.length == 1
      if vote[0].direction == amount
        destroy(:votable_id => params[:votable_id], :votable_type => params[:votable_type])
      else
        update(:direction => amount, :votable_id => params[:votable_id], :votable_type => params[:votable_type])
      end
    else raise "More than one vote exists for this votable."
    end
  end

  def create(params)
    @vote = Vote.new(:direction => params[:direction])
    @vote.votable_id = params[:votable_id]
    @vote.votable_type = params[:votable_type]
    @vote.user = current_user
    @vote.save
    redirect_to Rails.application.routes.recognize_path(request.referer)
  end

  def update(params)
    @vote = Vote.find_by_votable_id_and_votable_type(params[:votable_id], params[:votable_type])
    @vote.update_attributes(:direction => params[:direction])
    redirect_to Rails.application.routes.recognize_path(request.referer)
  end

  def destroy(params)
    @vote = Vote.find_by_votable_id_and_votable_type(params[:votable_id], params[:votable_type])
    @vote.delete
    redirect_to Rails.application.routes.recognize_path(request.referer)
  end

end

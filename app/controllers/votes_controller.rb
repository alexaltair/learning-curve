class VotesController < ApplicationController

  def create
    @vote = Vote.new(params[:vote])
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update_attributes(params[:vote])
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.delete
  end

end

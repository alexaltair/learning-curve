module ApplicationHelper

  def show_vote(object)
    Vote.get_votes_count(object)
  end

end

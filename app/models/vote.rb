# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  votable_id   :integer
#  votable_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ActiveRecord::Base
  attr_accessible :direction, :user, :votable

  belongs_to :user
  belongs_to :votable, polymorphic: true

  def self.get_vote_count(object)
    votes = Vote.where( :votable_id => object.id,
                        :votable_type => object.class )
    votes.inject(0) { |sum, vote| sum+vote.direction }
  end
end

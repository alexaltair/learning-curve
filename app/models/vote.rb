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
  attr_accessible :user_id, :votable_id, :votable_type

  belongs_to :user
  belongs_to :votable, polymorphic: true
end

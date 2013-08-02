# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  video       :string(255)
#  caption     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Answer < ActiveRecord::Base
  attr_accessible :caption, :question_id, :user_id, :video

  belongs_to :question
  belongs_to :user
  has_many :votes, as: :votable
end

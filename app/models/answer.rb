class Answer < ActiveRecord::Base
  attr_accessible :caption, :question_id, :user_id, :video

  belongs_to :question, :user
  has_many :votes, as: :votable
end

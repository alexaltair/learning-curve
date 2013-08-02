class Question < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :video

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable
end

class Lesson < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :video

  belongs_to :user
  has_many :votes, as: :votable
end

# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :text
#  video       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ActiveRecord::Base
  attr_accessible :description, :title, :user, :video

  belongs_to :user
  has_many :answers
  has_many :votes, as: :votable

  validates_presence_of :title, :description

end

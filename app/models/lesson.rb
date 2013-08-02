# == Schema Information
#
# Table name: lessons
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string(255)
#  description :text
#  video       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Lesson < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :video

  belongs_to :user
  has_many :votes, as: :votable
end

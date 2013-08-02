# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  email                 :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :questions, :answers, :votes, :lessons
end

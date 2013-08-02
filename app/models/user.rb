class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :questions, :answers, :votes, :lessons
end

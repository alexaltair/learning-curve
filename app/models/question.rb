class Question < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :video
end

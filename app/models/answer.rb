class Answer < ActiveRecord::Base
  attr_accessible :caption, :question_id, :user_id, :video
end

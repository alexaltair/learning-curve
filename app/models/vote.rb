class Vote < ActiveRecord::Base
  attr_accessible :user_id, :votable_id, :votable_type
end

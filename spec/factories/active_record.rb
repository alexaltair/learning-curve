FactoryGirl.define do


factory :question do
  title "question title"
  description "question description"
end

factory :answer do
  caption "answer title"
  user_id 1
  question_id 1
  end

end
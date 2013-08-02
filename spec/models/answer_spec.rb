# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  video       :string(255)
#  caption     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end

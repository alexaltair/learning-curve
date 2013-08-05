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
  it { should belong_to :question }
  it { should belong_to :user }
  it { should have_many :votes }
end

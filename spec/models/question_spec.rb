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

require 'spec_helper'

describe Question do
  it { should belong_to :user }
  it { should have_many :answers }
  it { should have_many :votes }

  it { should validate_presence_of :description}
  it { should validate_presence_of :title}
end

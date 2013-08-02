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

require 'spec_helper'

describe Lesson do
  pending "add some examples to (or delete) #{__FILE__}"
end

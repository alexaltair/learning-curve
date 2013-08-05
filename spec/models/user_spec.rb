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

require 'spec_helper'

describe User do
  it { should have_many :questions }
  it { should have_many :answers }
  it { should have_many :lessons }
  it { should have_many :votes }


end

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

class Lesson < ActiveRecord::Base
  require "youtube_it"

  attr_accessible :description, :title, :user, :video

  belongs_to :user
  has_many :votes, as: :votable

  def self.yt_session
     @yt_session ||= YouTubeIt::Client.new(:username => GOOGLE_USER_NAME, :password => GOOGLE_PASSWORD, :dev_key => GOOGLE_API_DEV_KEY)
  end

  def self.token_form(params, nexturl)
    yt_session.upload_token(video_options(params), nexturl)
  end

  def self.video_options(params)
    opts = {
     :title => params[:title],
     :category => "People",
     :keywords => ["test"]
    }
  end
end

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

class Answer < ActiveRecord::Base
  require "youtube_it"


  attr_accessible :caption, :question, :user, :video

  belongs_to :question
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
     :title => params[:caption],
     :category => "People",
     :keywords => ["test"]
    }
  end




end

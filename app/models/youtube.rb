class Youtube < ActiveRecord::Base
  belongs_to :user
  attr_accessible :about, :title, :youtube_url
end

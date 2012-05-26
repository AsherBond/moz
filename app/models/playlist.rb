class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :ptracks

  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  attr_accessible :title
end

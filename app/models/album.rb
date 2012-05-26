class Album < ActiveRecord::Base

  belongs_to :user

  has_many :songs

  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :label, :title, :year, :artwork
  
  # Validate images.
  # -----
  has_attached_file :artwork, :styles => {:small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#"},
                    :url => "/system/albums/artwork/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/albums/artwork/:id/:style/:basename.:extension"
end

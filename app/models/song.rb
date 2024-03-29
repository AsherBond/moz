class Song < ActiveRecord::Base
  belongs_to :album
  has_many :comments, as: :commentable
  attr_accessible :lyric, :title, :file, :artwork
  
  validates :title,
          presence: true,
          length: {
              minimum: 2, maximum: 40,
              :message => "is too short"
          }
  validates :lyric,
          presence: true,
          length: {
              minimum: 2, maximum: 1200,
              :message => "you have exceded 1200 letters"
          }
  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :artwork, :styles => {:small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#"},
                    :url => "/system/songs/artwork/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/songs/artwork/:id/:style/:basename.:extension"

  has_attached_file :file,
                    :content_type => ['audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio'],
                    :url => "/system/songs/file/:id/:basename.:extension",
                    :path => ":rails_root/public/system/songs/file/:id/:basename.:extension"
end

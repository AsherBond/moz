class Album < ActiveRecord::Base

  belongs_to :user

  has_many :songs
  has_many :comments, as: :commentable

  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :label, :title, :year, :artwork
  
  validates :label,
          presence: true,
          length: {
              minimum: 2, maximum: 40,
              :message => "is too short"
          }

  validates :title,
          presence: true,
          length: {
              minimum: 2, maximum: 40,
              :message => "is too short"
          }

  validates_numericality_of :year, :only_integer => true, :message => "can only be whole number."

  validates_inclusion_of :year, :in => 1900..2099, :message => "can only be between 1900 and 2099."


  # Validate images.
  # -----
  has_attached_file :artwork, :styles => {:small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#"},
                    :url => "/system/albums/artwork/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/albums/artwork/:id/:style/:basename.:extension"
end

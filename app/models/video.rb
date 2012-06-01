class Video < ActiveRecord::Base

  attr_accessible :about, :title, :year, :file
  
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title,
          presence: true,
          length: {
              minimum: 2, maximum: 40,
              :message => "is too short"
          }
  validates :about,
          presence: true,
          length: {
              minimum: 2, maximum: 250,
              :message => "you have exceded 250 letters"
          }
  validates_numericality_of :year, :only_integer => true, :message => "can only be whole number."

  validates_inclusion_of :year, :in => 1900..2099, :message => "can only be between 1900 and 2099."

  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :file, :styles => { 
				        :medium => { :geometry => "640x480", :format => 'flv' },
				        :thumb => { :geometry => "200x200#", :format => 'jpg', :time => 10 }
			  	    }
end

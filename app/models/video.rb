class Video < ActiveRecord::Base
  belongs_to :user
  attr_accessible :about, :title, :year, :file

  # Friendly URLS
  # -----
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :file, :styles => { 
				        :medium => { :geometry => "640x480", :format => 'flv' },
				        :thumb => { :geometry => "200x200#", :format => 'jpg', :time => 10 }
			  	    }
end

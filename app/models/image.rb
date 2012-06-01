class Image < ActiveRecord::Base
  belongs_to :gallery
  attr_accessible :alt
end

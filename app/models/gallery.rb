class Gallery < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title
end

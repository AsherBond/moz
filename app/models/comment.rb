class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  
  validates :content,
          presence: true,
          length: {
              minimum: 2, maximum: 250,
              :message => "you have exceded 250 letters"
          }
end

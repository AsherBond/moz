class Youtube < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  attr_accessible :about, :title, :youtube_url
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

end

class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  attr_accessible :content, :title, :photo
  
  validates :title,
          presence: true,
          length: {
              minimum: 2, maximum: 40,
              :message => "is too short"
          }

  validates :content,
          presence: true,
          length: {
              minimum: 2, maximum: 4000,
              :message => "you have exceded 4000 letters!"
          }
  has_attached_file :photo, :styles => {:small => "150x150#", :medium => "400x400#", :large => "900x900>", :avatar => "60x60#"},
                    :url => "/system/articles/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/articles/photos/:id/:style/:basename.:extension"
end

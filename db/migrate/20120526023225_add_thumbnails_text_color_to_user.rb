class AddThumbnailsTextColorToUser < ActiveRecord::Migration
  def change
  	add_column :users, :thumbnails_text_color, :string
  end
end

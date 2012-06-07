class AddAttachmentPhotoToBlocks < ActiveRecord::Migration
  def self.up
    add_column :blocks, :photo_file_name, :string
    add_column :blocks, :photo_content_type, :string
    add_column :blocks, :photo_file_size, :integer
    add_column :blocks, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :blocks, :photo_file_name
    remove_column :blocks, :photo_content_type
    remove_column :blocks, :photo_file_size
    remove_column :blocks, :photo_updated_at
  end
end

class AddSlugIndexs < ActiveRecord::Migration
  def up
  	add_column :users,  :slug, :string
  	add_column :albums, :slug, :string
  	add_column :videos, :slug, :string
  	add_column :songs,  :slug, :string

  	add_index :users,  :slug, unique: true
  	add_index :albums, :slug, unique: true
  	add_index :videos, :slug, unique: true
  	add_index :songs,  :slug, unique: true
  end

  def down
  end
end

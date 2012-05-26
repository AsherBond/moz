class AddMissingsFields < ActiveRecord::Migration
  def up
    add_column :users, :tables_link_color, :string
    add_column :users, :tables_link_hover_color, :string

    add_column :users, :thumbnails_link_color, :string
    add_column :users, :thumbnails_link_hover_color, :string
  end

  def down
  end
end

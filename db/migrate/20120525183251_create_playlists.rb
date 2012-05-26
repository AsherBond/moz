class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references :user
      t.string :title

      t.timestamps
    end
    add_index :playlists, :user_id
  end
end

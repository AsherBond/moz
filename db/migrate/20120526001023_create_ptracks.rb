class CreatePtracks < ActiveRecord::Migration
  def change
    create_table :ptracks do |t|
      t.references :playlist
      t.integer :song_id

      t.timestamps
    end
    add_index :ptracks, :playlist_id
  end
end

class CreateYoutubes < ActiveRecord::Migration
  def change
    create_table :youtubes do |t|
      t.references :user
      t.string :title
      t.text :about
      t.string :youtube_url

      t.timestamps
    end
    add_index :youtubes, :user_id
  end
end

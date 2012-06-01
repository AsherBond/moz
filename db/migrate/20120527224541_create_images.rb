class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :gallery
      t.string :alt

      t.timestamps
    end
    add_index :images, :gallery_id
  end
end

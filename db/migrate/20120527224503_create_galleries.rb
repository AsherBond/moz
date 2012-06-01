class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.references :user
      t.string :title

      t.timestamps
    end
    add_index :galleries, :user_id
  end
end

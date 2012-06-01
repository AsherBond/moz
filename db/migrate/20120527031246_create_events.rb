class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.integer :ticket_cost
      t.text :about
      t.references :user

      t.timestamps
    end
    add_index :events, :user_id
  end
end

class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :scope
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

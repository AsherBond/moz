class AddUserIdIndexToComments < ActiveRecord::Migration
  def change
  	add_index :comments, :user_id
  end
end

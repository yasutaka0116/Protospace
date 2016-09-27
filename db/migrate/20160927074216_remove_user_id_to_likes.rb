class RemoveUserIdToLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :user_id, :string
  end
end

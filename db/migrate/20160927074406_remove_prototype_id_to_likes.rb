class RemovePrototypeIdToLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :prototype_id, :string
  end
end

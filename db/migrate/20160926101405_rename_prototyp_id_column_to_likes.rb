class RenamePrototypIdColumnToLikes < ActiveRecord::Migration
  def change
    rename_column :likes, :prototyp_id, :prototype_id
  end
end

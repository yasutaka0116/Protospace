class AddWorksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :works, :string
  end
end

class AddPrototypeToLikes < ActiveRecord::Migration
  def change
    add_reference :likes, :prototype, index: true, foreign_key: true
  end
end

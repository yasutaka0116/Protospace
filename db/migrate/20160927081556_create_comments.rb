class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references  :user, index: true
      t.references  :prototype, index:true
      t.text  :comment

      t.timestamps null: false
    end
  end
end

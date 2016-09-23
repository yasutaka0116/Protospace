class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string  :name
      t.integer  :user_id
      t.text  :catchcopy
      t.text  :content

      t.timestamps null: false
    end
  end
end

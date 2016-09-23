class CreateCapturedimages < ActiveRecord::Migration
  def change
    create_table :capturedimages do |t|
      t.integer  :prototype_id
      t.integer  :role
      t.text  :image
      t.timestamps null: false
    end
  end
end

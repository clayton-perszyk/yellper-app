class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :rating
      t.integer :food_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

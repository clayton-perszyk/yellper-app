class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :cuisine
      t.string :image
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end

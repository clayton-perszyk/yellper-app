class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :hours
      t.string :phone_number
      t.string :url
      t.string :image

      t.timestamps null: false
    end
  end
end

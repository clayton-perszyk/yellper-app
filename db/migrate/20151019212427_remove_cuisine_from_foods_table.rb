class RemoveCuisineFromFoodsTable < ActiveRecord::Migration
  def change
    remove_column :foods, :cuisine
    add_column :foods, :description, :text
  end
end

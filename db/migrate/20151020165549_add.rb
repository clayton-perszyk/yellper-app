class Add < ActiveRecord::Migration
  def change
    add_column :restaurants, :rating_stars, :string
  end
end

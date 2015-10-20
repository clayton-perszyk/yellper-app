class Addtorest < ActiveRecord::Migration
  def change
    add_column :restaurants, :snippet_text, :string
    add_column :restaurants, :review_count, :string
  end
end

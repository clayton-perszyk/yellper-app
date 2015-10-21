class AddContribExtensions2 < ActiveRecord::Migration
  def change
    execute("SELECT set_limit(0.3);")
  end
end

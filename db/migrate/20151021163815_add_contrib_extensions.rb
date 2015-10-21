class AddContribExtensions < ActiveRecord::Migration
  def change
    execute("SELECT set_limit(0.7);")
  end
end

class Food < ActiveRecord::Base
  # include PgSearch
  # multisearchable against: [:name, :description]
  has_many :comments
end

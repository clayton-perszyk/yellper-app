class Food < ActiveRecord::Base
  has_many :comments
end

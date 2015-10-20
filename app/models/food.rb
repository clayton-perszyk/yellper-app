require 'textacular'

class Food < ActiveRecord::Base.extend(Textacular)
  belongs_to :restaurant
  has_many :comments
end

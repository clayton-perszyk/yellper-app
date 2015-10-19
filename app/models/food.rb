require 'textacular'

class Food < ActiveRecord::Base.extend(Textacular)

  has_many :comments
end

class Comment < ActiveRecord::Base
  validates :rating, :text,
            presence: true

  belongs_to :user
  belongs_to :food
end

module CommentsHelper
  def num_to_stars(number)
    starred_rating = ""
    empty_stars = 5 - number
    number.times { |n| starred_rating << '★' }
    empty_stars.times { |n| starred_rating << '☆' }
    starred_rating
  end
end

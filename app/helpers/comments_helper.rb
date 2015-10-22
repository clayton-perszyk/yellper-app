module CommentsHelper
  def num_to_stars(number)
    starred_rating = "<ul class='stars'>"
    empty_stars = 5 - number
    number.times { |n| starred_rating << '<li>★</li>' }
    empty_stars.times { |n| starred_rating << '<li>☆</li>' }
    starred_rating << "</ul>"
    starred_rating.html_safe
  end
end

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.allmenus.com/wa/seattle/-/?sort=popular'))

doc.css('.restaurant_name a').each do |url|
  doc = Nokogiri::HTML(open('http://www.allmenus.com/' + url.attribute('href').value))
  address = doc.css('span[itemprop=address]')[0].content.gsub(/\n/, "").gsub(/\s+/," ")
  restaurant_name = doc.css("h1[itemprop=name]")[0].content
  phone_number = doc.css('#phone_number')[0].content
  restaurant = Restaurant.create(location: address, phone_number: phone_number, name: restaurant_name)
  doc.css('.menu_item').each do |menuItem|
    item = Food.create(name: menuItem.css('.name')[0].content,
                       description: menuItem.css('.description')[0].content,
                       restaurant_id: restaurant.id)
  end
end

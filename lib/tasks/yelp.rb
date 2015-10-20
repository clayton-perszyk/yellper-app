require 'yelp'

client = Yelp::Client.new({ consumer_key: 'xlKUjkdAZRFouGJCpfAbyw',
                             consumer_secret: 'wzC3w_0pyw9yu3lPUH9goZoJw-E',
                             token: 'Z7FZV4BF6Ccxksh1I4TIQ_NPVAvUj727',
                             token_secret: 'iqLpS5jCKQRBrIb3b-aQcptma2s'
                           })
info =  client.business('pho-cyclo-seattle')
puts Restaurant.first
puts info.inspect
puts info.image_url
puts info.is_closed
puts info.name
puts info.url
puts info.rating_img_url_large
puts info.display_phone

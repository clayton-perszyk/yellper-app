class FoodsController < ApplicationController

  def index
   client = Yelp::Client.new({ consumer_key: 'xlKUjkdAZRFouGJCpfAbyw',
                             consumer_secret: 'wzC3w_0pyw9yu3lPUH9goZoJw-E',
                             token: 'Z7FZV4BF6Ccxksh1I4TIQ_NPVAvUj727',
                             token_secret: 'iqLpS5jCKQRBrIb3b-aQcptma2s'
                           })

   @restaurantName = Food.all.where(name:'Green Bean Wok')[0].restaurant.name

   @food = client.business('Phayathai-Cuisine-seattle')

 end
end

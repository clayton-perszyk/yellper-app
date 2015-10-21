namespace :yelp do
  desc "TODO"
  task refresh: :environment do
    client = Yelp::Client.new({ consumer_key: 'xlKUjkdAZRFouGJCpfAbyw',
                                 consumer_secret: 'wzC3w_0pyw9yu3lPUH9goZoJw-E',
                                 token: 'Z7FZV4BF6Ccxksh1I4TIQ_NPVAvUj727',
                                 token_secret: 'iqLpS5jCKQRBrIb3b-aQcptma2s'
                               })
    Restaurant.all.each do |restaurant|
      puts restaurant.name
      if restaurant.name.is_a?(String)
        params = { term: restaurant.name, limit: 1 }
        locale = { lang: 'US' }
        info = client.search('Seattle', params, locale)
        puts info.businesses[0].snippet_text
        puts info.businesses[0].review_count
        if info.businesses[0]
          restaurant.snippet_text = info.businesses[0].snippet_text if info.businesses[0].snippet_text
          restaurant.review_count = info.businesses[0].review_count if info.businesses[0].review_count
          # restaurant.url = info.businesses[0].url if info.businesses[0].url
          # restaurant.rating_stars = info.businesses[0].rating_img_url_large if info.businesses[0].rating_img_url_large
          # restaurant.phone_number = info.businesses[0].display_phone if info.businesses[0].display_phone
          restaurant.save
        end
      end
    end
  end
end

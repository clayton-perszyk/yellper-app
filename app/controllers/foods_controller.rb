class FoodsController < ApplicationController
  def search_form
  end

  def search
    #Add to search model
    @food = Food.fuzzy_search(food_params) if food_params
    render :search_form
  end

  def show
    @comment = Comment.new
    @food = Food.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:name)
  end

  def index
   client = Yelp::Client.new({ consumer_key: 'xlKUjkdAZRFouGJCpfAbyw',
                             consumer_secret: 'wzC3w_0pyw9yu3lPUH9goZoJw-E',
                             token: 'Z7FZV4BF6Ccxksh1I4TIQ_NPVAvUj727',
                             token_secret: 'iqLpS5jCKQRBrIb3b-aQcptma2s'
                           })
   @food = Food.all.where(name:'Green Bean Wok')[0]

   @restaurantName = @food.restaurant.name

   @restaurant = client.business('Chef-Liao-Asian-Fusion-Cuisine-seattle')

 end
end

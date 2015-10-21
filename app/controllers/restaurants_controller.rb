class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    map = GoogleStaticMap.new(:zoom => 14, :center => MapLocation.new(:address => @restaurant.location))
    map.markers << MapMarker.new(:color => "red", :location => MapLocation.new(:address => @restaurant.location))
    @mapImage = map.url('http')
  end

end

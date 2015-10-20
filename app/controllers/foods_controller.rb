class FoodsController < ApplicationController
  def index
    @food = Food.fuzzy_search('taco')
  end
end

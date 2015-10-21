class FoodsController < ApplicationController
  def search_form
  end

  def search
    #Add to search model
    @food = Food.fuzzy_search(food_params, false) if food_params
    render :search_form
  end

  def show
    @comment = Comment.new
    @food = Food.find(params[:id])
  end

  def random
    count = Food.all.count
    randomIndex = Random.new.rand(1..count)
    @food = Food.find(randomIndex)
    @comment = Comment.new
    render :show_random
  end

  private

  def food_params
    params.require(:food).permit(:name)
  end

end

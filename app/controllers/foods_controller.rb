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

  private

  def food_params
    params.require(:food).permit(:name)
  end

end

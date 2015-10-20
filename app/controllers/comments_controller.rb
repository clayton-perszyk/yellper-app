class CommentsController < ApplicationController
  # def index
  #   @food = Food.find(params[:id])
  #   redirect_to food_path(@food)
  # end

  def show

  end

  def new
    @food = Food.find(params[:id])
    @comment = Comment.new
  end

  def create
    @food = Food.find(params[:food_id])
    @comment = Comment.new(comment_params)
    @food.comments << @comment
    redirect_to @food
  end

  def edit

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:text, :rating)
  end
end

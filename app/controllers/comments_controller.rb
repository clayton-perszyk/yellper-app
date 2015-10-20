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
    if current_user
      @user = User.find(current_user.id)
      @user.comments << @comment
    end
    @food.comments << @comment
    redirect_to @food
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = "Comment updated successfully!"
    else
      flash[:alert] = "Problem updating comment. Please try agian."
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if current_user.id == @comment.user.id
      @food = Food.find(@comment.food.id)
      @comment.destroy
      flash[:success] = "Comment deleted successfully."
      redirect_to @food
    else
      flash[:alert] = "Problem with delete"
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :rating)
  end
end

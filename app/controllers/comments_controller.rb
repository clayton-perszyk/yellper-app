class CommentsController < ApplicationController
  def new
    @food = Food.find(params[:id])
    @comment = Comment.new
  end

  def create
    @food = Food.find(params[:food_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      if current_user
        @user = User.find(current_user.id)
        @user.comments << @comment
      end
      @food.comments << @comment
      flash[:success] = "Comment added successfully!"
      redirect_to @food
    else
      flash[:alert] = "Problem adding comment. Try again."
      redirect_to @food
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = "Comment updated successfully!"
      redirect_to :back
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
      redirect_to :back
    else
      flash[:alert] = "Problem with delete"
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :rating, :image)
  end
end

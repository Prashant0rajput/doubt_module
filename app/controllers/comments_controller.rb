class CommentsController < ApplicationController


  def create
    @doubt = Doubt.find(params[:doubt_id])
    @comments = @doubt.comments.create(comments_params)

    if @comments.save
      redirect_to root_path
    end
  end

  def destroy
    @doubt = Doubt.find(params[:doubt_id])
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to @doubt
  end



  def comments_params
    params.require(:comment).permit(:comment, :user_id)
  end
end

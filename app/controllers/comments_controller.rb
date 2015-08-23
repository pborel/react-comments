class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    comment = Comment.create(
                author: params[:author],
                text: params[:text])

    redirect_to comments_path
  end

  private

    def comment_params
      params.require(:comment).permit(:author, :text)
    end
end

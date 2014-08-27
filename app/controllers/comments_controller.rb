class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    respond_to do |format|
      if @comment.save
        toast('success',"Your comment has been posted!")
        format.html { redirect_to article_path(@comment.article) }
      else
        toast('error',"Please enter your name, email, and comment!")
        format.html { redirect_to article_path(@comment.article) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:author_name, :content, :email)
  end

end

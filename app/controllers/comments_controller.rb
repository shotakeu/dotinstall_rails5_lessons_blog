class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    #まずはpost_idを使って記事を特定
    @post = Post.find(params[:post_id])
    #その後にcommentを特定
    @comment = @post.comments.find(params[:id])
    #commentを削除
    @comment.destroy
    #記事の詳細へリダイレクト
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end

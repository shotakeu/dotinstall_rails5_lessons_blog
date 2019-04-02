class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # for debug
    #render plain: params[:post].inspect
    # save
    #@post = Post.new(params.require(:post).permit(:body, :title))
    @post = Post.new(post_params)

    if @post.save
      # redirect
      redirect_to posts_path
    else
      # render plain: @post.errors.inspect
      render 'new' # new.html.erbを描画
    end
  end

  def edit
    #個々の記事のデータがほしいのでshowからコピペ
    @post = Post.find(params[:id])
  end

  def update
    #まずはpostの取得
    @post = Post.find(params[:id])
    #渡ってきたデータでupdateしてあげればいい
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    #記事の特定
    @post = Post.find(params[:id])
    #記事データ削除
    @post.destroy
    #indexにリダイレクト
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end

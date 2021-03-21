class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create,:destroy]
  before_action :select_item, only: [:show, :destroy]

  def show
    @user = @post.user
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:success] = '投稿完了です!!'
      redirect_to root_path
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/index'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = '投稿を削除しました'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :image)
  end

  def select_item
    @post = Post.find(params[:id])
  end
end

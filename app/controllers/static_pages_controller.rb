class StaticPagesController < ApplicationController

  def index
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @all_posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end
end

class AllPostsController < ApplicationController
  def index
    @all_posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end
end

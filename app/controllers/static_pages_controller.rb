class StaticPagesController < ApplicationController
  before_action :move_to_index, except: :index
  def index
    if user_signed_in?
      @post = current_user.posts.build if user_signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @all_posts = Post.order('created_at DESC').paginate(page: params[:page], per_page: 20)
  end


  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

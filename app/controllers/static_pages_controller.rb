class StaticPagesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    if user_signed_in?
      @post = current_user.posts.build if user_signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def show
  end

  private

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end

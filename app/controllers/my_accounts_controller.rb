class MyAccountsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create,:show,:edit,:update]
  before_action :set_account, only: [:edit,:update,:show]
  before_action :move_to_root, only: [:edit,:update]

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def search
    @users = User.search(params[:keyword])
  end

  def show
    @posts = @user.posts.paginate(page: params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_account
    @user = User.find(params[:id])
  end

  def move_to_root
    redirect_to action: :index unless current_user.id == @user.id
  end
end

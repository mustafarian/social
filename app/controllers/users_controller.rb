class UsersController < ApplicationController

  before_action :authenticate_user!, only: :follow

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "Welcome to the site!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC")
  end

  def follow
    @leader = User.find(params[:id])

    if current_user.follow! @leader
      redirect_to @leader, notice: "You are not following " + @leader.name
    else
      redirect_to @leader, alert: "Error while trying to subscribe to " + @leader.name
    end

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
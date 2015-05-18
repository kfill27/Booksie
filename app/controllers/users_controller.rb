class UsersController < ApplicationController
  # before_action :check_invites, only: :profile

  def landing
    @users = User.all
  end

  def profile
    @user = User.find_by(username: params[:username].downcase)
    if @user.nil?
      @users = User.all
      flash.now[:alert] = "Your Booksie was not found"
      render 'landing'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
        flash[:success] = "Welcome to Booksie!"
        render 'profile'
      else
        render 'new'
      end
  end



private
 def user_params
  params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end

end


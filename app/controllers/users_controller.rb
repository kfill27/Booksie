class UsersController < ApplicationController
  # before_action :check_invites, only: :profile
  before_action :authenticate_user!, except: [:landing]

  def landing
    @users = User.all
  end

  def profile
    @user = User.find_by(username: params[:username])
    if user_signed_in?
      render 'profile'
    end
  end

  def contributor
    contributor = User.find_by(email: params[:email])
    Ability.create(role: 'contributor', user: contributor, booksie_page: current_user.booksie_page)
    if contributor.nil?
      flash[:notice] = "User not found."
    else
      flash[:notice] = "Added #{contributor.email} as a contributor"
    end
      # redirect_to :back
  end

  def settings
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Booksie!"
    else
      render 'new'
    end
  end

private
 def user_params
  params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :role)
  end
end

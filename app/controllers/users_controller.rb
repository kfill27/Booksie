class UsersController < ApplicationController
  # before_action :check_invites, only: :profile

  def landing
    @users = User.all
  end

  def profile
    @user = User.find_by(name: params[:name].capitalize)
  end

end

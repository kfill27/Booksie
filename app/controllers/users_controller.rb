class UsersController < ApplicationController
  # before_action :check_invites, only: :profile

  def landing
    @users = User.all
  end

  def profile
    @username = User.find_by(username: params[:username].capitalize)
  end

  # def username
  #   @name = first_name + last_name
  # end
end

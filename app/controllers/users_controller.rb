class UsersController < ApplicationController
  # before_action :check_invites, only: :profile

  def landing
    @users = User.all
  end

  def profile
    @user = User.find_by(name: params[:name].capitalize)
   end

# protected
#    def after_sign_in_path_for(resource)
#      user_path(current_user) profile
#    end
end

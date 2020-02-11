class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    authorize user
  end

  def user
    return @user = current_user unless params[:id]

    @user = User.find(params[:id])
    throw ActionController::RoutingError
              .new('User not found') unless @user

    @user
  end

  private

  def profile_params
    params.require(:user).permit(:first_name, :last_name, :username, :email)
  end

  helper_method :user
end

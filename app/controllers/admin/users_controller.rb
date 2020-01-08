class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = policy_scope(
        User,
        policy_scope_class: UserPolicy::Scope
    ).page(params[:page]).per(10)
  end

  def new
    @user = User.new
    authorize user
  end

  def create
    @user = User.new(user_params)
    authorize user

    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    authorize [user]
  end

  def update
    authorize user

    if user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    authorize user

    user.delete
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(
        :name, :email, :first_name,
        :last_name, :username, :position,
        :company, :country, :city,
        :address, :password,
        :password_confirmation
    )
  end

  def user
    @user ||= User.find(params[:id])
  end

  helper_method :user
end

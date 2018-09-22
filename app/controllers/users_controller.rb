class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize User

    @user.build_user_roles(params[:user][:roles])

    if @user.save
      redirect_to user_path(@user), :notice => "User updated"
    else
      redirect_to user_path(@user), :alert => "Unable to update user."
    end
  end

  def manual_create
    @user = User.new secure_params
    authorize User

    @token = Devise.friendly_token(12)
    @user.password = @token
    @user.reset_password_token = @token

    @user.build_user_roles(params[:user][:roles])

    if @user.save
      WelcomeMailer.with(user: @user, token: @token).welcome_email.deliver_later
      redirect_to users_path, :note => "User created and email sent"
    else
      redirect_to new_user_path, :alert => "Unable to create user."

    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:name, :email)
  end

end

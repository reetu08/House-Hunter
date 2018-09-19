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

  def manual_create
    @user = User.new secure_params
    authorize @user
    @token = Devise.friendly_token(10)

    if @user.save
      UserMailer.with(user: @user, token: @token).welcome_email.deliver_later
      redirect_to '/users', :note => "User created and email sent"
    else
      redirect_to '/users', :alert => "Unable to create user."
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
    params.require(:user).permit(:role)
  end

end

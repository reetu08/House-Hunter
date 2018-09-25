class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized

  def index
    @users = User.all
    authorize @users
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    @user.assign_attributes secure_params
    @user.role_ids = params[:user][:role_ids]

    if @user.save
      redirect_to user_path(@user), :notice => "User updated"
    else
      redirect_to user_path(@user), :alert => "Unable to update user."
    end
  end

  def manual_create
    @user = User.new secure_params
    authorize @user

    @user.role_ids = params[:user][:role_ids]

    token, enc = Devise.token_generator.generate(User, :reset_password_token)

    @user.password = token
    @user.reset_password_token = enc
    @user.reset_password_sent_at = Time.now.utc

    if @user.save
      WelcomeMailer.with(user: @user, token: token).welcome_email.deliver_later
      redirect_to users_path, :note => "User created and email sent"
    else
      redirect_to new_user_path, :alert => "Unable to create user."

    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:name, :email, :preferred_contact, :phone)
  end

end

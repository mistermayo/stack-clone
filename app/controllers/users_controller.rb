class UsersController < ApplicationController

after_create :send_welcome_message

  def send_welcome_message
    CustomerMailer.deliver_welcome_message(self)
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Posted Sucessfully!!"
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Smell you later, user."
    redirect_to users_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user])
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password_hash, :password_salt)
  end
end

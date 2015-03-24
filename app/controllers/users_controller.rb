class UsersController < ApplicationController

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
    @questions = Question.all
<<<<<<< HEAD
=======

>>>>>>> d4c124ae07a38bc2e24ad049073ef0a97e12bcd8
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      flash[:notice] = "Registered Sucessfully!!"
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
    params.require(:user).permit(:name, :email, :password)
  end
end

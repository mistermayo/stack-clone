class QuestionsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @question = Question.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Thanks for your question."
      redirect_to user_path(@user)
    else
      flash[:notice] = "Error in question submission."
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Your question has been removed."
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    if @question.update(params[:question])
      redirect_to user_path(@question.user)
    else
      render :edit
    end
  end

  def question_params
    params.require(:question).permit(:description)
  end
end

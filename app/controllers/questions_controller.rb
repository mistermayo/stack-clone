class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end


  def show
    @questions = Question.all
    @question = Question.find(params[:id])
    @user = User.find(@question.user_id)
    render :show
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Your question has been removed."
    redirect_to questions_path
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render :edit
    end
  end

  def question_params
    params.require(:question).permit(:description, :user_id)
  end
end

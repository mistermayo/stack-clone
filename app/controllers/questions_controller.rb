class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
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
    redirect_to user_path(@user)
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(params[:question])
      redirect_to user_path(@question.user)
    else
      render :edit
    end
  end

  def question_params
    params.require(:question).permit(:description, :user_id)
  end
end

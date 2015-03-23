class AnswersController < ApplicationController


  def new
    @user = User.find(params[:user_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = "Thanks for your answer."
      redirect_to user_questions_path(@question)
    else
      flash[:notice] = "Error in answer submission."
      render :new
    end
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "Your answer has been removed."
    redirect_to question_path(@question)
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(params[:answer])
      redirect_to question_path(@answer.question)
    else
      render :edit
    end
  end

  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end
end

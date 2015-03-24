class AnswersController < ApplicationController
  def send_response_message
    CustomerMailer.deliver_response_message(self)
  end
<<<<<<< HEAD
=======

>>>>>>> d4c124ae07a38bc2e24ad049073ef0a97e12bcd8

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    UserMailer.response_email(@answer).deliver_now
    if @answer.save
      UserMailer.response_email(@answer).deliver_now
      flash[:notice] = "Thanks for your answer."
      redirect_to questions_path(@answer.question)
    else
      flash[:notice] = "Error in answer submission."
      render :new
    end
  end


  def edit
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
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def answer_params
    params.require(:answer).permit(:description, :user_id, :question_id)
  end
end

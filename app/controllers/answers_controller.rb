class AnswersController < ApplicationController
  def send_response_message
    CustomerMailer.deliver_response_message(self)
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.upvote_by @user
    redirect_to questions_path(@answer.question)
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.downvote_by @user
    redirect_to questions_path(@answer.question)
  end


  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
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

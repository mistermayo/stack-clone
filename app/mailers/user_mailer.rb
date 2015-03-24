class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
<<<<<<< HEAD

=======
  
>>>>>>> d4c124ae07a38bc2e24ad049073ef0a97e12bcd8
  def response_email(answer)
    @user = answer.question.user
    @question = answer.question
    @answer = answer
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Someone has answered your question')
  end
end

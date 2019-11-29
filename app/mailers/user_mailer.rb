class UserMailer < ApplicationMailer

  def welcome_message(student)
    @student = student
    mail(to: @student.email, subject: 'Welcome to Symphony School of Music!')
  end

end

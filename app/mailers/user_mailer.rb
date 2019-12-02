class UserMailer < ApplicationMailer
   default from: 'symphonyschool123@gmail.com'

  def welcome_message(student)
    @student = student
    mail(to: @student.email, subject: 'Welcome to Symphony School of Music!')
  end

end

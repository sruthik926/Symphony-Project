class SessionsController < ApplicationController
   skip_before_action :authorized

  def new
   render :new
  end


  def create
    @student = Student.find_by(email: params[:email])
    @instructor = Instructor.find_by(email: params[:email])

    if @student && @student.authenticate(params[:password])
        session[:student_id] = @student.id
        session[:email] = @student.email
        session[:name] = @student.full_name
        session[:user_type] = "Student"
        redirect_to @student
    elsif @instructor && @instructor.authenticate(params[:password])
        session[:instructor_id] = @instructor.id
        session[:email] = @instructor.email
        session[:name] =@instructor.full_name
        session[:user_type] = "Instructor"
        redirect_to @instructor
    else
        flash[:message] = "Invalid username or password"
        redirect_to new_session_path
    end
  end

  def destroy
    session[:cart] = nil
    session.delete(:email)
    flash[:message] = 'You logged out.'
    redirect_to new_session_path
  end



end

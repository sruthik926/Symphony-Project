class SessionsController < ApplicationController
   skip_before_action :authorized

  def new
   render :new
  end


  def omniauth_create
    oauth_email  = request.env["omniauth.auth"]["info"]["email"]
    @student = Student.find_by(email: oauth_email)
    session[:student_id] = @student.id
    session[:email] = @student.email
    session[:name] = @student.full_name
    session[:user_type] = "Student"
    redirect_to @student
  end


  def create

    # if request.env["omniauth.auth"]
    #  # student has logged in via facebook
    #   oauth_email =request.env["omniauth.auth"]["email"]
    #   @student = Student.find_by(email: oauth_email)
    # else
    #   @student = Student.find_by(email: params[:email])
    # end
    # fb login is avaliable only for student

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
    session[:search_instructor] = nil
    session[:search_date_from] = Date.today
    session[:search_to_lesson] = Date.today
    flash[:message] = 'You logged out.'
    redirect_to new_session_path
  end

  private

  # def auth
  #   request.env['omniauth.auth']
  # end



end

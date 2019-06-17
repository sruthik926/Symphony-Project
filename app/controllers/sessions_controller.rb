class SessionsController < ApplicationController
   # authorized does not get called for sessions actions. Don't need to be logged in in order to view login page o login,
   skip_before_action :authorized

  def new
   # render :new
   # rendering sessions new.erb which is the login page -
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

    # Retriving student object - fetching from database nased on the login email

     @student = Student.find_by(email: params[:email])

    # Retriving instructor object - fetching from database nased on the login email

    @instructor = Instructor.find_by(email: params[:email])

    if @student && @student.authenticate(params[:password])
       #if student object exists and student's login password is matched against the password digest, (being done throygh has secure password, then store the student info using session cache
        #redirect to student show page
        session[:student_id] = @student.id
        session[:email] = @student.email
        session[:name] = @student.full_name
        session[:user_type] = "Student"
        redirect_to @student
        # render json: @student

      #otherwise instructor obkject exists and instructor password is matched against the password digest, store instructor info in session
      #redirect to instructor show page
    elsif @instructor && @instructor.authenticate(params[:password])
        session[:instructor_id] = @instructor.id
        session[:email] = @instructor.email
        session[:name] =@instructor.full_name
        session[:user_type] = "Instructor"
        redirect_to @instructor
    else
        #otherwise login info not valid. Flash message displayed. redirect to login page
        flash[:message] = "Invalid username or password"
        redirect_to new_session_path
    end
  end

  def destroy
    # when user logs out, session hash keys are cleared.
    session[:cart] = nil
    # destroys the session hash
    session.delete(:email)
    # during session, search filtered criteria info is retained
    session[:search_instructor] = nil
    session[:search_date_from] = Date.today
    session[:search_to_lesson] = Date.today
    #when user logs out/session destroyed, he/she will see this message - and redirected to login page
    flash[:message] = 'You logged out.'
    redirect_to new_session_path
  end



  # def auth
  #   request.env['omniauth.auth']
  # end



end

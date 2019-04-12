class StudentsController < ApplicationController
 skip_before_action :authorized ,only: [:new, :create]
 def new
   @student = Student.new
   render :new
 end

 def index
  @students = Student.all
  render :index
 end

 def show
   @student = Student.find(params[:id])
   render :show
 end

 def create
  @student = Student.create(student_params)

  #@email = student_params[:email]
  if @student.valid?
    session[:student_id] = @student.id
    session[:email] = @student.email
    session[:name] = @student.full_name
    session[:user_type] = "Student"
    redirect_to @student
  else
    flash[:errors] = @student.errors.full_messages
    render :new
  end
 end

 # def login
 #  render :login
 # end

 # def display_page
 #   @student = Student.find_by_email(params[:email])
 #
 #    @appointment = Appointment.where("student_id = ?", @student.id)
 #   if @appointment.empty? == true
 #       @message = 'You currently have no appointments.'
 #   else
 #       @message = 'These are your appointments.'
 #   end
 #      render "display_page"
 # end

 def edit
   @student = Student.find(params[:id])
   render :edit
 end

 def update
  @student = Student.find(params[:id])
  @student.update(student_params)

  if @student.valid?
    flash[:errors] = "Your profile has been updated."
    redirect_to student_path(@student)
  else
    flash[:errors] = @student.errors.full_messages
    redirect_to edit_student_path(@student.id)
  end

 end


 def destroy
   appoint = Appointment.find(params[:id])
   appoint.destroy
   redirect_to welcome_path
 end

 def all
   @stu = Student.all
   render :all
 end

 private

 def student_params
   params.require(:student).permit(:first_name, :last_name, :email, :address_1, :address_2, :phone_number, :password, :password_confirmation)
 end



end

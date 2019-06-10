class StudentsController < ApplicationController
 skip_before_action :authorized ,only: [:new, :create]
 before_action :find_student, only: [:show, :edit, :update]

 def new
     @student = Student.new
    # student object is being instantiated - empty object at this point - this passed in through
   # render :new
    #student new.erb is being displayed
 end

 def index
  @students = Student.all.active
   #student objects -  being retrived from db,  - all in an array
   # render :index
   #display/render student index.erb
   # render html
   # respond_to do |f|
   #   f.html
   #   f.json {render json: @students}
   # end
    render json: @students
 end

 def all_students
  if session[:user_type] == "Instructor"
      @students = Student.all
  else
     redirect_to :welcome
  end
end

 def show
   #retrive student object database,
   @student = Student.find(params[:id])
   # render :show
   #render student show.erb
 end

 def create
  @student = Student.new(student_params)
    #student object is created - strong params are being used

  if @student.valid?
     #student is created - store student info through sessions
    session[:student_id] = @student.id
    session[:email] = @student.email
    session[:name] = @student.full_name
    session[:user_type] = "Student"
    redirect_to @student
     #redirect to student show page
  else
    flash[:errors] = @student.errors.full_messages
     #show error messages
    render :new
     #render new page - student form m - render her, so that the info will remain even if there are errors
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
   #@student = Student.find(params[:id])
    #retrive student object from db
   render :edit
    #render edit page
 end

 def update
  #@student = Student.find(params[:id])
   #student object from db,
  @student.update(student_params)
   #update student params

  if @student.valid?
     #if successfully ypdated, then display message
    flash[:sign] = "Your profile has been updated."
    redirect_to student_path(@student)
     #redirect to student show page
  else
    flash[:errors] = @student.errors.full_messages
     #display error messages
    redirect_to edit_student_path(@student.id)
     #redirect to student edit page
  end

 end


 # def destroy
 #   appoint = Appointment.find(params[:id])
 #    #retrive appointment from db,
 #   appoint.destroy
 #    #destroy appointment
 #   redirect_to welcome_path
 #    #redirect to welcome page
 # end
 # need to remove this -

 # def all
 #   @stu = Student.all
 #   render :all
 # end
 #remove this

 private

 def student_params
   #using strong params - private method, student key is required, other keys not necessarily required, but nm other key is allowed
   params.require(:student).permit(:first_name, :last_name, :email, :address_1, :address_2, :phone_number, :password, :password_confirmation)
 end

def find_student
  @student = Student.find(params[:id])
end


end

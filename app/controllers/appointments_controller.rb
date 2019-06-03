class AppointmentsController < ApplicationController
   before_action :find_appointment, only: [:show, :edit, :update, :destroy]

  def index
       @appointments = current_user.appointments
       # gets all the appointments of the users from the db - based on association
       render :index
       #render the appointments index.erb - which displays all the appointment info
  end

  def search
    #storing whatever is entered into search criteria in session variables - can use it on my erb
    session[:search_instructor] = params[:appointment][:instructor_id]
    session[:search_date_from] = params[:lesson_date]
    session[:search_to_lesson] = params[:to_lesson]

    if session[:user_type] == "Student"
      @appointments = current_user.appointments.where(instructor_id: params[:appointment][:instructor_id], lesson_date: params[:lesson_date]..params[:to_lesson])
          #filter out all the student appointments based on instructor_id, range of the date, (..) inclusive of the to and from dates - represented by two dots,
    else
      @appointments = current_user.appointments.where(student_id: params[:appointment][:student_id], lesson_date: params[:lesson_date]..params[:to_lesson])
          #if instructor is logged in , filter out all the student appointments based on student_id, range of the date, (..) inclusive of the to and from dates - represented by two dots,
    end
    render :index
      #goes to appointments index.erb -
  end


  def new
      @appointment = current_user.appointments.new
       # current_user's appointment object is being instantiated - empty object at this point - this passed in through the form for
      if session[:user_type] == "Student"
       render :new
       #render the appointment new.erb page if student is logged in
      else
       render :instructor_new
       #render the appointment instructor_new.erb if instructor is logged in  - possible to refactor appointment new/instructor_new - use partiaL?
      # end
      end
  end

  def create

     #@appointment = current_user.appointments.create(appointment_params)
    @appointment = current_user.appointments.build(appointment_params)
     #appointment. build/new

       #current_user's appointments is being created at this point - this is after submitting the form, Strong params are being used here.
     if @appointment.save
        #appointment.save - refactor - instructor feedback

         #if apppointent is successfully created and passes the validation requirements, then current user is redirected to the appointment show page -
         redirect_to appointment_path(@appointment.id)
     else
         #otherwise error messages will be displayed - using flash hash - one request. Current user is then redirected to 'create appointment' page -
          flash.now[:errors] = @appointment.errors.full_messages
          render :new
         #wouldn't use the flash -
         #better to render
    end
  end


  def show
    # retrives the appointment object from the database - based on the params or id passed
    #@appointment = Appointment.find(params[:id])
    render :show
  end

  def edit
       # retrives the appointment object from the database - based on the params or id passed
    #@appointment = Appointment.find(params[:id])
      if session[:user_type] == "Student"
        render :edit
      # if student is logged in, then display appointment edit erb
      else
        render :instructor_edit
        #if instructor is logged in, then display appointment instructor edit erb
      end
  end

  def update
    # retrives the appointment object from the database - based on the params or id passed
    #@appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
     #update the params
    redirect_to appointments_path
    #redirect to appointment index page
  end


 def destroy
   #@appointment = Appointment.find(params[:id])
      # retrives the appointment object from the database - based on the params or id passed
   @appointment.destroy
       # deletes the appointment object
   redirect_to appointments_path
      # redirect to appointment index page
 end




  private

  def appointment_params
    params.require(:appointment).permit(:student_id, :instructor_id, :subject_taught, :lesson_date, :time, :to_lesson)
    # private method -  scope of the method is within object, strong params, so can prevent hackers or anyone from changing it through the console
  end

 def find_appointment
  @appointment = Appointment.find(params[:id])
 end



end

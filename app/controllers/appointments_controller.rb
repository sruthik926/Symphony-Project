class AppointmentsController < ApplicationController

  def index
       @appointments = current_user.appointments
       #
       render :index
  end

  def search
    #storing whatever is entered into search criteria in session variables
    session[:search_instructor] = params[:appointment][:instructor_id]
    session[:search_date_from] = params[:lesson_date]
    session[:search_to_lesson] = params[:to_lesson]

    if session[:user_type] == "Student"
      @appointments = current_user.appointments.where(instructor_id: params[:appointment][:instructor_id], lesson_date: params[:lesson_date]..params[:to_lesson])
    else
      @appointments = current_user.appointments.where(student_id: params[:appointment][:student_id], lesson_date: params[:lesson_date]..params[:to_lesson])
    end
    render :index
  end


  def new
     #@appointment = Appointment.new
      @appointment = current_user.appointments.new
      #byebug
    # @appointment.student_id = current_user.id
    #@appointment = current_user.appointments.new
     if session[:user_type] == "Student"
       render :new
     else
       render :instructor_new
     end
  end

  def create
     #@appointment = Appointment.create(appointment_params)
     @appointment = current_user.appointments.create(appointment_params)

     #@appointment = current_user.create(appointment_params)
     #@appointment = current_user.appointments.new(params[:appointment])
    #@appointment = current_user.appointments.build(appointment_params)
     if @appointment.valid?
         redirect_to appointment_path(@appointment.id)
     else
         flash[:errors] = @appointment.errors.full_messages
         redirect_to new_appointment_path
    end
  end


  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
      if session[:user_type] == "Student"
        render :edit
      else
        render :instructor_edit
      end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to appointments_path
  end


 def destroy
   @appointment = Appointment.find(params[:id])
   @appointment.destroy
   redirect_to appointments_path
   # if session[:user_type] == "Student"
   #     redirect_to student_path(current_user.id)
   # else
   #    redirect_to instructor_path(current_user.id)
   # end
 end




  private

  def appointment_params
    params.require(:appointment).permit(:student_id, :instructor_id, :subject_taught, :lesson_date, :time, :to_lesson)
  end



end

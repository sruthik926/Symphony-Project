class AppointmentsController < ApplicationController

  def index
     if session[:user_type] == "Student"
       @appointments = current_user.appointments
       render :index
     else
       render :instructor_appointments
    end
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
    render :show
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
    params.require(:appointment).permit(:student_id, :instructor_id, :subject_taught, :lesson_date, :time)
  end



end

class InstructorsController < ApplicationController

  def index
   @instructors = Instructor.all
   render :index
  end

  def show
     @instructor = Instructor.find(params[:id])
    render :show
  end

 def my_students
    render :my_students
 end





end

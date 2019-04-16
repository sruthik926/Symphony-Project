class InstructorsController < ApplicationController

  def index
   @instructors = Instructor.all
   render :index
  end

  def show
     @instructor = Instructor.find(params[:id])
    render :show
  end


end

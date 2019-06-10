class AdminController < ApplicationController
   skip_before_action :authorized

  def index


    render :index
      
  end

def show_students
  @students = Student.all
  render json: @students
end


end

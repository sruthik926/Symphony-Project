class StaticController < ApplicationController
    #don't need to be logged in/authorized to view welcome page
   skip_before_action :authorized


  def welcome
     #destroy the session email ?
    session.delete(:email)
     
    render :welcome_page
     #display welcome page - static , which has links to login, login to facebook, regsiter new student
  end



end

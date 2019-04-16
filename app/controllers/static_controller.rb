class StaticController < ApplicationController
   skip_before_action :authorized

  # def about
  #   render :about_page
  # end

  def welcome
    session.delete(:email)
    # session_path(session)
    render :welcome_page
  end



end

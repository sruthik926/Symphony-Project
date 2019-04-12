class ApplicationController < ActionController::Base
   before_action :authorized
   helper_method :current_user, :logged_in?, :find_the_document


  def current_user

    if session[:user_type] == "Student"
      Student.find_by({ email: session[:email]})
    else
      Instructor.find_by({ email: session[:email]})
    end

  end
      #if student not found, find instructor
      #Instructor.find_by({email: session[:email]})
    #end


  def logged_in?

    !!current_user
  end

  def authorized
    flash[:message] = "You must be logged in."
    redirect_to new_session_path unless logged_in?
  end


  def cart
    session[:cart] ||= []
  end

  def add_document_to_cart(document_id)

    cart << document_id

    #@documents_in_my_cart = Document.find(cart)
  end

  def find_the_document
    @documents_in_my_cart = Document.find(cart)
  end

end

class ApplicationController < ActionController::Base
   before_action :authorized
   # gets called before every action across all controllers
   helper_method :current_user, :logged_in?, :find_the_document
   # can be used within other controllers, erbs,

  def current_user
 #current user being found based on session email - if not student, then find by ibstructor
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
    # checks to see if someon(current_user) is logged in - (current_user returns object, !current_user - false, !!current_user - true)
    !!current_user
  end

  def authorized
    #user has to be logged in to access most of the app, if not, they are redirected to login page
    flash[:message] = "You must be logged in."
    redirect_to new_session_path unless logged_in?
  end


  def cart
    #storing cart in a session hash - whicn will allow it to remain until the person is logged out, using double pipe operator, if session[:cart] is nil, then set it to empty array otherwise return session[:cart]
    session[:cart] ||= []
  end

  def add_document_to_cart(document_id)
     -#passing document id, which is then being pushed into session cart (array)
    cart << document_id

    #@documents_in_my_cart = Document.find(cart)
  end

  def find_the_document
    @documents_in_my_cart = Document.find(cart)
    #returns an array of all document objects - find takes an array - cart is an array of ids use this in the document index erb
  end

end

class DocumentsController < ApplicationController


  def index
     # gets all the documents of the users from the db - based on association
     @documents = current_user.documents
     find_the_document
    
      #invoking the find_the_document method - poibts to application controller method
     render :index
      # render the documents index page
  end

  def new
     @document = current_user.documents.new
      #document object is being instantiated
     render :new
      #render document.new erb
  end

  def create
    @document = current_user.documents.create(document_params)
     #document is being created - using strong params
    redirect_to documents_path
     #redirect to documents index page
  end

  def edit
    #document object is being retrived from db - based on params
    @document = Document.find(params[:id])
    render :edit
     #document edit is being rendered
  end

 def show
    #rails_blob_path(current_user.avatar, disposition: "attachment")
 end

 private

 def document_params
    #strong params being passed -
   params.require(:document).permit(:student_id, :instructor_id, :name, :link)
    #document key must be passed - params hash - keys can be passed - other keys not allowed
 end







end

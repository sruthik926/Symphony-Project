class DocumentsController < ApplicationController

  def index
     @documents = Document.all
     find_the_document
     #find_the_document
     render :index
  end

 def show
   @doc_link = Document.link
   render :show
 end










end

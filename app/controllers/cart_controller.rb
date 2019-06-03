class CartController < ApplicationController

def update
  add_document_to_cart(params[:id])
   # calling the add_document_to_cart method - point to application controller - passing each params (id_) as argument, 
  redirect_to documents_path
    #redirecxt to document index page
end


end

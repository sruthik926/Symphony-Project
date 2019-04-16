class CartController < ApplicationController

def update
  #byebug
  # d = Document.find(params[:id])
  add_document_to_cart(params[:id])
  redirect_to documents_path
end


end

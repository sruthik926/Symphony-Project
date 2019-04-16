class DocumentsController < ApplicationController


  def index
     @documents = Document.all
     find_the_document
     #find_the_document
     render :index
  end

  def new
     @document = current_user.documents.new
     render :new
  end

  def create
    @document = current_user.documents.create(document_params)
    redirect_to documents_path
  end

  def edit
    @document = Document.find(params[:id])
    render :edit
  end

 def show
  # @doc_link = Document.link
   #send_data(data, :filename => "IMG_6961.JPG")
  # send_file(Rails.root.join('app' , 'assets', 'images', 'IMG_6961.jpg'))
   #send_file '//file:///Users/sruthikrishna/Downloads/IMG_6961.JPG/to.jpeg', :type => 'image/jpg', :disposition => 'inline'
   #send_file '/file:///Users/sruthikrishna/Downloads/IMG_6961.JPG/to.zip'

  # send_file("#{Rails.root}/public/IMG_6961.JPG", :type=>"jpg", :disposition=> "inline; filename=IMG_6961.JPG")
    # format.html { send_data @resource.body } # => Download the image file.

  end

 private

 def document_params
   params.require(:document).permit(:student_id, :instructor_id, :name, :link)
 end







end

class AddLinkToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :link, :string
  end
end

class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.integer :student_id
      t.integer :instructor_id
      t.timestamps
    end
  end
end

class RemoveAddress2FromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :address_2, :string
  end
end

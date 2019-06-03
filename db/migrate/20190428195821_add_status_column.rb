class AddStatusColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :status, :string, :default => "Active"
  end
end

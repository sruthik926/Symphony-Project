class AddToDateColumn < ActiveRecord::Migration[5.2]
  def change
     add_column :appointments, :to_lesson, :date
  end
end

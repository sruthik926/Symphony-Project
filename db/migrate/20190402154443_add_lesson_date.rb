class AddLessonDate < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :lesson_date, :date
  end
end

class RemoveLessonDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :lesson_date, :datetime
  end
end

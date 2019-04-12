class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :student_id
      t.integer :instructor_id
      t.string :subject_taught
      t.datetime :lesson_date

      t.timestamps
    end
  end
end

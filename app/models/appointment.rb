class Appointment < ApplicationRecord
  belongs_to :student
  belongs_to :instructor

 validates :instructor_id, :subject_taught, :lesson_date, presence: true


end

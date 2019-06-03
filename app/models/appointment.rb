class Appointment < ApplicationRecord
  belongs_to :student
  belongs_to :instructor
 #join model - student belongs to appointment, belings to instructor
 validates :instructor_id, :subject_taught, :lesson_date, presence: true
  #makes sure these fields are entered 


end

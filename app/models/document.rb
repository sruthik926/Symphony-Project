class Document < ApplicationRecord

   #has_one_attached :file
    #used active storage -

  belongs_to :student
  belongs_to :instructor
    #setting relationships, document belongs to student and instructor,

  validates :student_id, :name, :link, presence: true
    #validation = these fields are required
end

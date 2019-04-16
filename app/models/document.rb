class Document < ApplicationRecord
  belongs_to :student
  belongs_to :instructor

  validates :student_id, :name, :link, presence: true
end

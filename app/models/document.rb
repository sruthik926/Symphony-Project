class Document < ApplicationRecord

  has_one_attached :file

  belongs_to :student
  belongs_to :instructor

  validates :student_id, :name, :link, presence: true
end

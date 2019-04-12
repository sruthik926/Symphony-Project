class Document < ApplicationRecord
  belongs_to :student
  belongs_to :instructor
end

class Student < ApplicationRecord
   has_secure_password

  def full_name
     self.first_name + " " + self.last_name
  end

  has_many :instructors, through: :appointments
  has_many :appointments
  has_many :documents

  validates :email, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :first_name, :last_name, :email, :address_1, :phone_number, presence: true
  validates :phone_number, length: { is: 10 }



end

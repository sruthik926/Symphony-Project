class Instructor < ApplicationRecord
    has_secure_password

   has_many :students, through: :appointments
   has_many :appointments
   has_many :documents

   def full_name
     self.first_name + " " + self.last_name
   end

end

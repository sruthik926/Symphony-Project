class Instructor < ApplicationRecord
    has_secure_password
     #adds two fields to model, password, password confirmation, password digest column - table
     #rails tool - like an accessor - what happens is password gets converted into encrypted versiom, - salt - string gets prepended to string, befopre being hashed, - password gets matched against password digest - match, verified, authenticated,

   #the password method  - password being passed as argument, then get converted into encrypted string,
 #



   has_many :students, through: :appointments
   has_many :appointments
   has_many :documents
   #sets associations, instructors has many students through appointments,
   #instructors has many appointments, and documents

   def full_name
     self.first_name + " " + self.last_name
     #class method - which returns the first and last name concatenated (full name )
   end

end

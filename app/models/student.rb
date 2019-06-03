class Student < ApplicationRecord
   has_secure_password
   #adds two fields to model, password, password confirmation, password digest column - table
   #rails tool - like an accessor - what happens is password gets converted into encrypted versiom, - salt - string gets prepended to string, befopre being hashed, - password gets matched against password digest - match, verified, authenticated,

 scope :active, -> {where(status: "Active")}


  def full_name
     self.first_name + " " + self.last_name
     # class method - which returns the first and last name concatenated (full name )
  end

  has_many :instructors, through: :appointments
  has_many :appointments
  has_many :documents

  #students have many instructors, through appointments
  # students have many appointments
  #students have many docunments

  validates :email, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
    #checke for unique email address - 1 or more word character before @sign, 1 or more word character after @sign,  2 more of a-z/A-Z..one period
  validates :first_name, :last_name, :email, :address_1, :phone_number, presence: true
   #validation - these fields are required
  validates :phone_number, length: { is: 10 }
    #phone number must be 10 digits



end

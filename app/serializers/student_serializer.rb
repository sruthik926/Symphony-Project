class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :phone_number, :email

  has_many :appointments
end

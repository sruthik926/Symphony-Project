# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Instructor.create(first_name: "Anitha", last_name: "Krishna", email:"anithak@gmail.com", phone:"1234567891", subject_taught: "Vocal", password:"abc")
Instructor.create(first_name: "Ramya", last_name: "Narayan", email:"ramya@gmail.com", phone:"6781901234", subject_taught: "Dance", password:"bbb")
Instructor.create(first_name: "Krishna", last_name: "Seshadri", email:"seshadri@gmail.com", phone:"8881234213", subject_taught: "Comp Science", password:"ccc")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


House.create(name: "rep vikings", description: "vida loka")
Dweller.create(name: "carlos", house: House.first)
BillMonth.create(house: House.first, month: DateTime.now, status: 1)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



users = User.create([
  {
    first_name: "admin",
    last_name: "admin",
    email: "admin@harryfairbanks.com"
  },
  {
    first_name: "Bob",
    last_name: "Exampleson",
    email: "bexampleson@harryfairbanks.com"
  },
  {
    first_name: "Joe",
    last_name: "Exampleson",
    email: "jexampleson@harryfairbanks.com"
  }
])
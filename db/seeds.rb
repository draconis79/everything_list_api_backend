# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
              { username: 'mandy', password_digest: '123' },
              { username: 'joshua', password_digest: '123' },
              { username: 'adam', password_digest: '123' },
              { username: 'liz', password_digest: '123' }
            ])

List.create([
              { name: 'Grocery', task: 'eggs' },
              { name: 'Packing', task: 'pjs' },
              { name: 'Costco', task: 'chicken broth' },
              { name: 'Gus', task: 'challah bread' }
            ])

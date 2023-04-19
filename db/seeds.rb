# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Genre.create([{ name: 'action' },
              { name: 'animation' },
              { name: 'comedy' },
              { name: 'drama' },
              { name: 'experimental' },
              { name: 'fantasy' },
              { name: 'historical' },
              { name: 'horror' },
              { name: 'romance' },
              { name: 'science fiction' },
              { name: 'thriller' },
              { name: 'western' }])

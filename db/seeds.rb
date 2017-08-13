# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create([
  {name: 'A Game of Thrones', description: 'First book of \'A Song of Ice and Fire\' series' },
  {name: 'A Clash of Kings', description: 'Second book of \'A Song of Ice and Fire\' series' },
  {name: 'A Storm of Swords', description: 'Third book of \'A Song of Ice and Fire\' series' },
  {name: 'A Feast for Crows', description: 'Fourth book of \'A Song of Ice and Fire\' series' },
  {name: 'A Dance with Dragons', description: 'Fifth book of \'A Song of Ice and Fire\' series' },
  {name: 'Hunger Games', description: 'Written by Suzanne Collins' },
  {name: 'The Maze Runner', description: 'Written by James Dashner' }
])

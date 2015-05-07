# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Create an standard user
standard = User.create(
  email:    'standard@example.com',
  password: 'helloworld'
  )
standard.skip_confirmation!
standard.save!

5.times do
  todo = Todo.new(
    description:   Faker::Hacker.say_something_smart,
    created_at: Time.now,
    user: standard
  )
  todo.save
end
todos = Todo.all.count
 
puts "#{todos} todos were created"
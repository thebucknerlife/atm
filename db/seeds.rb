# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1000.times { User.create(name: Faker::Name.name) }
ids = User.ids

10000.times do
  match = Match.new(host_id: ids.sample, activity: Faker::Company.bs)
  match.guest_id = ids.sample until match.guest_id && match.guest_id != match.host_id
  match.save
end
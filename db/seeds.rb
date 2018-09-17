# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = Role.create([{ name: 'ADMIN' }])
hunter = Role.create([{ name: 'HOUSE-HUNTER' }])
realtor = Role.create([{ name: 'REALTOR' }])

user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
user.roles << [admin, hunter, realtor]
user.save
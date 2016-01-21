# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Phil', password_digest: 'password')

Feed.create(user_id: 1)

Source.create(feed_id: 1, name: "HackerNews")
Source.create(feed_id: 1, name: "TechCrunch")
Source.create(feed_id: 1, name: "CNNTech")

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Generating Users"
[{ pseudo: "Antoine", email: "antoine@ringtwice.com" }, 
{ pseudo: "Benjamin", email: "benjamin@ringtwice.com" }, 
{ pseudo: "Blanche", email: "blanche@ringtwice.com" }, 
{ pseudo: "Carl", email: "carl@ringwice.com" }, 
{ pseudo: "Christophe", email: "christophe@ringtwice.com" }, 
{ pseudo: "Delael", email: "delael@ringtwice.com" }, 
{ pseudo: "Elisabeth", email: "elisabeth@ringtwice.com" }, 
{ pseudo: "Jonathan", email: "jonathan@ringtwice.com" }, 
{ pseudo: "Justine", email: "justine@ringtwice.com", role: 'admin' }, 
{ pseudo: "Lucia", email: "lucia@ringtwice.com" }, 
{ pseudo: "Ranja", email: "ranja@ringtwice.com" }, 
{ pseudo: "Samuel", email: "samuel@ringtwice.com" }, 
{ pseudo: "Sandjiv", email: "sandjiv@ringtwice.com", role: 'admin' }, 
{ pseudo: "Sébastien", email: "sebastieng@ringtwice.com" }, 
{ pseudo: "Ségolène", email: "segolene@ringtwice.com" }, 
{ pseudo: "Tom", email: "tom@ringtwice.com" }].each { User.create(email: _1[:email], pseudo: _1[:pseudo], password: 'ringtwice') }

puts "Generating Restos"
[ { date: Date.today }, { date: Date.tomorrow }, { date: Date.tomorrow + 1.day }, { date: Date.tomorrow + 2.days }, { date: Date.tomorrow + 3.days } ].each { Resto.create(date: _1[:date]) }

puts "Generating Participations"
Resto.all.each do |resto|
  User.all.sample(6).each { Participation.create(user: _1, resto: resto) }
end

puts "Generating MeetingIntents"
Resto.includes(:users).all.each do |resto|
  user_ids = resto.users.pluck(:id)
  user_ids.sample(4).each do |user_id|
    MeetingIntent.create(resto: resto, target_id: (user_ids - [user_id]).sample, initiator_id: user_id)
  end
end

puts "Seeds generated"
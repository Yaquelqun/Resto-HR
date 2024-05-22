# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


users = [{ pseudo: "Antoine", email: "antoine@ringtwice.com" }, 
{ pseudo: "Benjamin", email: "benjamin@ringtwice.com" }, 
{ pseudo: "Blanche", email: "blanche@ringtwice.com" }, 
{ pseudo: "Carl", email: "carl@ringwice.com" }, 
{ pseudo: "Christophe", email: "christophe@ringtwice.com" }, 
{ pseudo: "Delael", email: "delael@ringtwice.com" }, 
{ pseudo: "Elisabeth", email: "elisabeth@ringtwice.com" }, 
{ pseudo: "Jonathan", email: "jonathan@ringtwice.com" }, 
{ pseudo: "Justine", email: "justine@ringtwice.com" }, 
{ pseudo: "Lucia", email: "lucia@ringtwice.com" }, 
{ pseudo: "Ranja", email: "ranja@ringtwice.com" }, 
{ pseudo: "Samuel", email: "samuel@ringtwice.com" }, 
{ pseudo: "Sandjiv", email: "sandjiv.parassou@gmail.com" }, 
{ pseudo: "Sébastien", email: "sebastieng@ringtwice.com" }, 
{ pseudo: "Sébastien", email: "sebastien@ringtwice.com" }, 
{ pseudo: "Ségolène", email: "segolene@ringtwice.com" }, 
{ pseudo: "Tom", email: "tom@ringtwice.com" }]

users.each { User.create(email: _1[:email], pseudo: _1[:pseudo], password: 'ringtwice') }

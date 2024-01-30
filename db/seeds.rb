# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



# User.create(email: "jplarivaux@test.com", name: "Jeremiah", password: "password", password_confirmation: "password")
# User.create(email: "jerry@test.com", name: "Jerry", password: "password", password_confirmation: "password")

# 10.times do |x|
#   Post.create(title: "Title #{x}", body: "Body #{x} Words go here idk", user_id: User.first.id)
# end


User.create(email: 'jplarivaux@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Jeremiah',
  role: User.roles[:admin])
User.create(email: 'jerry@test.com',
  password: 'password',
  password_confirmation: 'password',
  name: 'Jerry')

10.times do |x|
  post = Post.create(title: "Title #{x}", 
                     body: "Body #{x} Words go here idk", 
                     user_id: User.first.id)

  5.times do |y| 
    Comment.create(body: "Comment #{y}",
                   user_id: User.second.id,
                   post_id: post.id)
  end
end
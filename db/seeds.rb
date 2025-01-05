# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
puts "Clearing existing data..."
User.destroy_all
Post.destroy_all
Comment.destroy_all
Follow.destroy_all

# Create users
puts "Creating users..."
users = [
  {
    email: "john.smith@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    email: "jane.doe@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    email: "bob.wilson@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    email: "sarah.parker@example.com",
    password: "password123",
    password_confirmation: "password123"
  },
  {
    email: "mike.johnson@example.com",
    password: "password123",
    password_confirmation: "password123"
  }
].map { |attrs| User.create!(attrs) }

# Create follows (create a small network where everyone follows at least 2 others)
puts "Creating follows..."
users.each_with_index do |user, index|
  2.times do |n|
    following_index = (index + n + 1) % users.length
    Follow.create!(
      follower_id: user.id,
      following_user_id: users[following_index].id
    )
  end
end

# Create posts with more varied content
puts "Creating posts..."
posts = [
  {
    author: users[0],
    content: "Just finished reading an amazing book about artificial intelligence. The future is now! 📚🤖 #AI #reading",
    likes: rand(1..50)
  },
  {
    author: users[1],
    content: "Beautiful sunset at the beach today. Nature never fails to amaze me! 🌅 #nature #peace",
    likes: rand(1..50)
  },
  {
    author: users[2],
    content: "Excited to announce I'm starting a new project next week! Stay tuned for updates 🚀 #career #development",
    likes: rand(1..50)
  },
  {
    author: users[3],
    content: "Made my grandmother's secret recipe pasta today. Nothing beats homemade food! 🍝 #cooking #family",
    likes: rand(1..50)
  },
  {
    author: users[4],
    content: "Just completed my first marathon! Six months of training paid off 🏃‍♂️ #fitness #achievement",
    likes: rand(1..50)
  },
  {
    author: users[0],
    content: "Learning Ruby on Rails has been such an amazing journey! #coding #webdev",
    likes: rand(1..50)
  },
  {
    author: users[1],
    content: "Working from home with my cat as my supervisor 😺 #WFH #catlife",
    likes: rand(1..50)
  }
].map { |attrs| Post.create!(attrs) }

# Create comments with more meaningful interactions
puts "Creating comments..."
comments_data = [
  {
    post: posts[0],
    author: users[1],
    content: "Which book was it? I'm looking for good AI-related reads!"
  },
  {
    post: posts[0],
    author: users[2],
    content: "AI is definitely shaping our future. Great topic! 👍"
  },
  {
    post: posts[1],
    author: users[3],
    content: "Stunning! Which beach is this? I need to visit! 😍"
  },
  {
    post: posts[2],
    author: users[4],
    content: "Can't wait to hear more about it! Good luck!"
  },
  {
    post: posts[2],
    author: users[0],
    content: "Sounds exciting! Let me know if you need any help."
  },
  {
    post: posts[3],
    author: users[1],
    content: "Would love to get that recipe if you're willing to share! 😊"
  },
  {
    post: posts[4],
    author: users[2],
    content: "Congratulations! That's a huge achievement! 🎉"
  },
  {
    post: posts[5],
    author: users[3],
    content: "Rails is awesome! Have you tried building any projects yet?"
  },
  {
    post: posts[6],
    author: users[4],
    content: "Cat supervisors are the best kind! 😸"
  }
].map { |attrs| Comment.create!(attrs) }

puts "Seeding completed successfully! Created:"
puts "- #{User.count} users"
puts "- #{Follow.count} follows"
puts "- #{Post.count} posts"
puts "- #{Comment.count} comments"

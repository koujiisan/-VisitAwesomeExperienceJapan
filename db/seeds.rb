# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# ユーザーを作成
user = User.create!(
  name: 'Test User',
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password',
)

# ユーザーに関連付けられた経験を作成
10.times do |i|
  user.experiences.create!(
    title: "Experience #{i + 1}",
    description: "This is a description for Experience #{i + 1}."
  )
end

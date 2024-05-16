# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Experience.create([
  { title: 'Experience 1', description: 'Description for experience 1', tag: 'Tag1', time: '2024-05-16 10:00:00', cost: '1000', image: 'image1.jpg' },
  { title: 'Experience 2', description: 'Description for experience 2', tag: 'Tag2', time: '2024-05-17 11:00:00', cost: '2000', image: 'image2.jpg' },
  # 他のデータも追加可能
])

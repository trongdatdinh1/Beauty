# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create!(email: "hero4120@gmail.com", password: "123456", password_confirmation: "123456", admin_role: true, user_role: true, profile_attributes: {name: "Admin"})

30.times do
  title = Faker::Pokemon.name
  content = Faker::Lorem.sentence(4)
  Post.create!(title: title,
    content: content,
    created_at: Faker::Date.between(3.days.ago, Date.today),
    updated_at: Time.zone.now,
    user_id: 1,
    post_img: File.new('app/assets/images/7.jpg'),
    price: 12)
end

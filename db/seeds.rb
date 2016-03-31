# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    confirmed_at: DateTime.new)
end

# gauth: I've disabled it because of my after_create :create_business method
# User.all.each do |user|
#   Business.create(
#     user_id: user.id,
#     name: Faker::Company.name,
#     address: 'Place Sainte-Gudule, 5',
#     logo: 'https://d21ii91i3y6o6h.cloudfront.net/gallery_images/from_proof/5808/large/1433932171/le-wagon-logo.png')
# end

Business.all.each do |business|
  3.times do
    Workspace.create(
      business_id: business.id,
      # name: Faker::Address.city_prefix,
      location: Faker::Address.street_name,
      price: Faker::Number.number(3),
      capacity: 10,
      wifi: true)
  end
end

Workspace.all.each do |workspace|
  3.times do
    Unavailability.create(
      workspace_id: workspace.id,
      start_time: Faker::Date.between(Date.today, 1.week.from_now),
      end_time: Faker::Date.between(1.week.from_now, 2.month.from_now))
  end
end

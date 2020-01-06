# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(
    username: "admin",
    first_name: "admin",
    last_name: "admin",
    password: "password",
    role: 0,
    status: 0
)

User.create!(
    username: "technician",
    first_name: "technician",
    last_name: "technician",
    password: "password",
    role: 1,
    status: 0
)

User.create!(
    username: "customer",
    first_name: "customer",
    last_name: "customer",
    password: "password",
    role: 2,
    status: 0
)

user = User.find(3)

5.times do
  message = Message.create(to: user, title: Faker::Name.name,  body: Faker::Lorem.sentence)
  MessageStatus.create(user: user, message: message, status: [0,1].sample)
end

10.times do
    Standard.create(name: Faker::Name.name)
    Insurance.create(name: Faker::Name.name)
    Reason.create(name: Faker::Name.name)
    DenyReason.create(name: Faker::Name.name)
    Item.create(name: Faker::Name.name)
end

20.times do
    Contract.create!(
        customer_id: 3,
        user_id: 2,
        title: Faker::Name.name,
        description: Faker::Lorem.paragraph,
        service_day: Faker::Number.within(range: 1..30),
        start_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
        finish_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
        standard_finish_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
        insurance_finish_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
        swing: Faker::Number.within(range: 1..10),
        automatic: Faker::Number.within(range: 1..10),
        standard_id: Standard.all.sample.id,
        insurance_id: Insurance.all.sample.id
    )
end

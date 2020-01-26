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
    con = Contract.create!(
        customer_id: 3,
        user_id: 2,
        building_number: Faker::Name.name,
        description: Faker::Lorem.paragraph,
        service_day: Faker::Number.within(range: 1..30),
        start_date: Faker::Date.between(from: 2.years.ago, to: Date.today + 1.year),
        finish_date: Faker::Date.between(from: 2.years.ago, to: Date.today+ 1.year),


        
    )
    1..2.times do
        Elevator.create(
            contract_id: con.id,
            standard_finish_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
            insurance_finish_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
            swing: Faker::Number.within(range: 1..10),
            automatic: Faker::Number.within(range: 1..10),
            standard_id: Standard.all.sample.id,
            insurance_id: Insurance.all.sample.id,
            standard_type: Faker::Number.within(range: 0..1),
            elevator_type: Faker::Number.within(range: 0..1),
        )    end
    

end

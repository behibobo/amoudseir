 User.create!(
     username: "admin",
     first_name: "admin",
     last_name: "admin",
     password: "password",
     role: 0,
     status: 0,
     gender: 0,
 )

 User.create!(
     username: "technician",
     first_name: "technician",
     last_name: "technician",
     password: "password",
     role: 1,
     status: 0,
     gender: 0,

 )

# User.create!(
#     username: "customer",
#     first_name: "customer",
#     last_name: "customer",
#     password: "password",
#     role: 2,
#     status: 0,
#     gender: 0,
# )


#100.times do
#    Contract.create!(
#        customer: User.where(role: 2).first,
#        user: User.where(role: 1).first,
#        building_number: (1000...30000).to_a.sample,
#        service_day: (1...31).to_a.sample,
#        total_price: 1230000,
#        start_date: Date.today - 3.years,
#        finish_date: Date.today - 2.years,
#    )
#end

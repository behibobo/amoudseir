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

User.create!(
    username: "customer",
    first_name: "customer",
    last_name: "customer",
    password: "password",
    role: 2,
    status: 0,
    gender: 0,
)

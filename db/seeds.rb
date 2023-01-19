# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
BranchOffice.create!({
  name: "prueba",
  direc: "462, 1742.",
  tel: "1131681533",
  location: Location.create!({
    name: "Juan Maria Gutierrez",
    province: "Buenos Aires"
    }),
  schedule: Schedule.create!({
    open_hour_monday: "08:00:00",
    close_hour_monday: "21:00:00",

    open_hour_tuesday:"08:00:00",
    close_hour_tuesday:"21:00:00",

    open_hour_wednesday:"08:00:00",
    close_hour_wednesday:"21:00:00",

    open_hour_thursday:"08:00:00",
    close_hour_thursday:"21:00:00",

    open_hour_friday:"08:00:00",
    close_hour_friday:"21:00:00",

    open_hour_saturday:"08:00:00",
    close_hour_saturday:"21:00:00",

    open_hour_sunday:"08:00:00",
    close_hour_sunday:"21:00:00"

  })
})

User.create!({
  email: "admin@admin.com",
  rol: "admin",
  password: "adminadmin"
})

User.create!({
  email: "operador@operador.com",
  rol: "operator",
  password: "operadoroperador",
  branch_office: BranchOffice.find(1)
})

User.create!({
  email: "cliente@cliente.com",
  rol: "client",
  password: "clientecliente"
})
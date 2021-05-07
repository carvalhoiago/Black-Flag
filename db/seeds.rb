# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
iago = User.create(name: 'Iago Carvalho', email: 'iago@gmail.com', password: '12345678', password_confirmation: '12345678', type: 'admin')
iago.save
iago.image.attach(io: File.open('./public/img/profile.png'), filename: 'profile.png')
joao = User.create(name: 'Joao sem braço', email: 'joao@gmail.com', password: '12345678', password_confirmation: '12345678', type: 'user')
joao.save
joao.image.attach(io: File.open('./public/img/profile.png'), filename: 'profile.png')
# teste se o type = user como default esta funcionando
pedro = User.create(name: 'Pedro Pedrosa', email: 'pedro@gmail.com', password: '12345678', password_confirmation: '12345678')
pedro.save
pedro.image.attach(io: File.open('./public/img/profile.png'), filename: 'profile.png')
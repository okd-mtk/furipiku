# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者側のログインのメアドとパスワード
Admin.create!(
   email: 'admin@test.com',
   password: 'password1'
)

#顧客側のログインのメアドとパスワード
Customer.create!(
  [
    {email: 'hsdld@test.com', name: 'Hsdld', password: 'password2', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_1.png"), filename:"profile_1.png") },
    {email: 'spendi@test.com', name: 'Spendi',password: 'password3', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/profile_2.png"), filename:"profile_2.png") }
  ]
)

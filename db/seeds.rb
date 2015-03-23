# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(email:"admin@indorse.com",password: "12345678",password_confirmation:"12345678",first_name:"business" ,last_name:"business")

SettingContent.create(terms_condition:"t &c", about_us:"about us")

b=Business.create!(business_name:"business1",address:"ahmedabad",contact_person:"indorse1",contact_number:8888888888,first_name:"business1",last_name:"business1",email:"business1@indorse.com",password:"12345678")

s=Store.create(name:"store1",address:"Sola Road,Bhyugdev",contact_person:"store1",contact_number:"888888888",business_id:b.id)

s1=Store.create(name:"store2",address:"Gurukul,Memnager",contact_person:"store2",contact_number:"888888888",business_id:b.id)

s3=Store.create(name:"store3",address:"sarvopali mall Bhyugdev",contact_person:"store3",contact_number:"888888888",business_id:b.id)





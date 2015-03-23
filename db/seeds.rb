# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(email:"admin@indorse.com",password: "12345678",password_confirmation:"12345678",first_name:"business" ,last_name:"business")

b1=Business.create!(business_name:"business1",address:"ahmedabad",contact_person:"indorse1",contact_number:8888888888,first_name:"business1",last_name:"business1",email:"business1@indorse.com",password:"12345678")

b2=Business.create!(business_name:"business2",address:"New Yorkin keskuspuisto, NY, United States",contact_person:"indorse2",contact_number:8888888888,first_name:"business2",last_name:"business2",email:"business2@indorse.com",password:"12345678")

s1 = Store.create(name:"store1",address:"Sola Road,Bhyugdev",contact_person:"store1",contact_number:"1234567890",business_id:b1.id, latitude: 23.45012, longitude: 72.45789)

s2 = Store.create(name:"store2",address:"Gurukul,Memnager",contact_person:"store2",contact_number:"1234567891",business_id:b1.id, latitude: 23.45012, longitude: 72.45789)

s3 = Store.create(name:"store3",address:"sarvopali mall Bhyugdev",contact_person:"store3",contact_number:"1234567895",business_id:b1.id, latitude: 23.45012, longitude: 72.45789)

s4 = Store.create(name:"store4",address:"New York Marriott Marquis, Broadway, New York, NY, United States",contact_person:"store1",contact_number:"1234567890",business_id:b2.id, latitude: 23.45012, longitude: 72.45789)

s5 = Store.create(name:"store5",address:"New York Hilton Midtown, Avenue of the Americas, New York, NY, United States",contact_person:"store2",contact_number:"1234567891",business_id:b2.id, latitude: 23.45012, longitude: 72.45789)

s6 = Store.create(name:"store6",address:"The Hilton Club New York, Avenue of the Americas, Midtown, New York, NY, United States",contact_person:"store3",contact_number:"1234567895",business_id:b2.id, latitude: 23.45012, longitude: 72.45789)

Offer.create( offer_name: "25 % Discount", task_to_perform: "Instagram", offer_for: 0, offer_type: "OneTime", punch_count: nil, offer_valid_upto: "2015-03-28 10:45:00", offer_expire_on: "2015-03-28 10:45:00", store_id: s1.id, task_url: "https://instagram.com/p/0R1zDFpC7V/", image_file_name: "IMG_0076.PNG", image_content_type: "image/png", image_file_size: 254898, image_updated_at: "2015-03-21 10:45:58")

Offer.create(offer_name: "Buy 2 Get 3 Free", task_to_perform: "Instagram", offer_for: 0, offer_type: "OneTime", punch_count: nil, offer_valid_upto: "2015-03-30 10:50:00", offer_expire_on: "2015-03-30 10:50:00", store_id: s2.id, task_url: "https://instagram.com/p/0R1zDFpC7V/", image_file_name: "IMG_0077.PNG", image_content_type: "image/png", image_file_size: 155890, image_updated_at: "2015-03-21 12:30:58")

 Offer.create(offer_name: "100 % Discount", task_to_perform: "Facebook", offer_for: 0, offer_type: "OneTime", punch_count: nil, offer_valid_upto: "2015-03-25 05:32:00", offer_expire_on: "2015-03-25 05:32:00", store_id: s3.id, task_url: "www.facebook.com", image_file_name: "Screenshot_from_2015-03-21_17_14_35.png", image_content_type: "image/png", image_file_size: 191744, image_updated_at: "2015-03-23 05:33:36")

Offer.create( offer_name: "80 % Discount", task_to_perform: "Facebook", offer_for: 0, offer_type: "OneTime", punch_count: nil, offer_valid_upto: "2015-03-29 05:37:00", offer_expire_on: "2015-03-29 05:37:00", store_id: s4.id, task_url: "www.facebook.com", image_file_name: "IMG_0079.PNG", image_content_type: "image/png", image_file_size: 160201, image_updated_at: "2015-03-23 05:38:28")

Offer.create(offer_name: "Buy 2 Get 30% Discount", task_to_perform: "Facebook", offer_for: 0, offer_type: "Punchcard", punch_count: 3, offer_valid_upto: "2015-05-23 07:44:00", offer_expire_on: "2015-04-23 07:44:00", store_id: s5.id, task_url: "", image_file_name: "icon-chat.png", image_content_type: "image/png", image_file_size: 4191, image_updated_at: "2015-03-23 07:46:19")

Offer.create(offer_name: "50% Discount", task_to_perform: "Facebook", offer_for: 0, offer_type: "Punchcard", punch_count: 3, offer_valid_upto: "2015-03-30 09:09:00", offer_expire_on: "2015-03-30 09:09:00", store_id: s6.id, task_url: "", image_file_name: "IMG_0079.PNG", image_content_type: "image/png", image_file_size: 160201, image_updated_at: "2015-03-21 09:12:34")

Offer.create( offer_name: "20% Discount", task_to_perform: "Facebook", offer_for: 0, offer_type: "Punchcard", punch_count: 5, offer_valid_upto: "2015-04-23 10:42:00", offer_expire_on: "2015-03-23 10:42:00", store_id: s1.id, task_url: "", image_file_name: "IMG_0077.PNG", image_content_type: "image/png", image_file_size: 155890, image_updated_at: "2015-03-21 10:44:48")

Offer.create(offer_name: "Buy 1 Get 1 Free", task_to_perform: "Facebook", offer_for: 0, offer_type: "Punchcard", punch_count: 3, offer_valid_upto: "2015-04-25 09:03:00", offer_expire_on: "2015-03-25 09:03:00", store_id: s2.id, task_url: "www.facebook.com", image_file_name: "02_Find.png", image_content_type: "image/png", image_file_size: 586521, image_updated_at: "2015-03-21 09:07:34")

Offer.create(offer_name: "Special Offer", task_to_perform: "Facebook", offer_for: 0, offer_type: "OneTime", punch_count: nil, offer_valid_upto: "2015-03-30 09:30:00", offer_expire_on: "2015-03-30 09:30:00",  store_id: s3.id, task_url: "www.facebook.com", image_file_name: "Screenshot_from_2015-03-21_14_45_15.png", image_content_type: "image/png", image_file_size: 166998, image_updated_at: "2015-03-23 09:40:18")

Offer.create(offer_name: "New Offer ", task_to_perform: "Facebook", offer_for: 0, offer_type: "OneTime", punch_count: nil, offer_valid_upto: "2015-05-22 11:14:00", offer_expire_on: "2015-04-22 11:14:00", store_id: s4.id, task_url: "https://instagram.com/p/0R1zDFpC7V/", image_file_name: "IMG_0078.PNG", image_content_type: "image/png", image_file_size: 91742, image_updated_at: "2015-03-21 11:16:41")

Offer.create( offer_name: "Test Offer", task_to_perform: "Facebook", offer_for: 0, offer_type: "OneTime", punch_count: nil, offer_valid_upto: "2015-03-29 12:10:00", offer_expire_on: "2015-03-29 12:10:00", store_id: s5.id, task_url: "https://instagram.com/p/0R1zDFpC7V/", image_file_name: "IMG_0075.PNG", image_content_type: "image/png", image_file_size: 272508, image_updated_at: "2015-03-21 12:11:03")

SettingContent.create(terms_condition:"t &c", about_us:"about us")

Ibeacon.create( udid: "cda73eb7be81", major: "7896542", minor: "98523",store_id: s1.id)
Ibeacon.create( udid: "d03007622e15", major: "234785", minor: "78541",store_id: s2.id)
Ibeacon.create( udid: "efe60886efd1", major: "65234", minor: "78542",store_id: s3.id)
require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  User.delete_all
  User.reset_pk_sequence
  Business.delete_all
  Business.reset_pk_sequence
  Event.delete_all
  Event.reset_pk_sequence
  Job.delete_all
  Job.reset_pk_sequence
  Candidature.delete_all
  Candidature.reset_pk_sequence
end

#admin
User.create(first_name: "Edd", last_name: "Mine", email: "admin@test.fr", phone_number:"+33612345678", password:"azerty", password_confirmation:"azerty", role: 2)

#employer
User.create(first_name: "Jo", last_name: "Meister", email: "employer@test.fr", phone_number:"+33623456789", password:"azerty", password_confirmation:"azerty", role: 1)

#candidate
User.create(first_name: "Candy", last_name: "Date", email: "candidate@test.fr", phone_number:"+33634567890", password:"azerty", password_confirmation:"azerty", role: 0)

#employers + business
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone_in_e164, password:"azerty", password_confirmation:"azerty", role: 1)
  Business.create(name: Faker::Restaurant.name, address: Faker::Address.street_address, postal_code: Faker::Address.zip_code, city: Faker::Address.city, user_id: User.last.id)
end

#candidates
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::PhoneNumber.cell_phone_in_e164, password:"azerty", password_confirmation:"azerty", role: 0)
end

#event + jobs
10.times do
  Event.create(name: Faker::Restaurant.name, date: DateTime.now + (rand * 21), description: Faker::Restaurant.review, business_id: Business.all[rand(0..9)].id)
  rand(1..3).times do
  	Job.create(name: Faker::Job.title, description: Faker::Hipster.sentence, dresscode: Faker::Military.space_force_rank, free_stead: rand(1..5), date: Event.last.date, duration: rand(2..10), rate: rand(10..40), event_id: Event.last.id )
    rand(0..1).times do
      Candidature.create(user_id: User.all[rand(15..22)].id, job_id: Job.last.id, hired: [true, false].sample)
    end
  end
end

namespace :utils do
  
  desc "CRIAR FAKE ADMINS"
  task generate_admins: :environment do
  	22.times do
  		Admin.create!(email: Faker::Internet.email,
  									name: Faker::Name.name,
  									password: "123456", password_confirmation: "123456",
  									role:[0,1].sample)
  	end
  end

end

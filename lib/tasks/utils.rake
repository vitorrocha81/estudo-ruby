namespace :utils do
  
  desc "CRIAR FAKE ADMINS"
  task generate_admins: :environment do
  	10.times do
  		Admin.create!(email: Faker::Internet.email,
  									password: "123456", password_confirmation: "123456")
  	end
  end

end

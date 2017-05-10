namespace :utils do
  
  desc "CRIAR FAKE ADMINS"
  task generate_admins: :environment do
  	22.times do
  		Admin.create!(email: Faker::Internet.email,
  									name: Faker::Name.name,
  									password: "123456", password_confirmation: "123456",
  									role:[0,1].sample)
  	end
  	puts "ADMINS CRIADOS COM SUCESSO"	
  end

  desc "CRIAR FAKE ADMINS"
  task generate_ads: :environment do
  	100.times do
  		Ad.create!(title: Faker::Lorem.sentence(1),
  							description: Faker::Lorem.sentence([2,3,4,5,6].sample),
  							member: Member.all.sample,
  							category: Category.all.sample,
                price: "#{Random.rand(500)},#{Random.rand(99)}",
                picture: File.new(Rails.root.join('public', 'templates', 'home', 'adsImages', "#{Random.rand(1...5)}.jpg"))
                )
  	end
  	puts "ADS CRIADOS COM SUCESSO"
  end

end

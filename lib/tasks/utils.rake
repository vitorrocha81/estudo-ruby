namespace :utils do

  # executar comandos 
    desc "SETUP DO APP EM DEV"
    task setup_app: :environment do
      puts "inicio do setup_app"

      puts "Apabando db ... #{%x(rake db:drop)}"
      puts "Criando db ... #{%x(rake db:create)}"
      puts "Migrations ... #{%x(rake db:migrate)}"
      puts "seeds... #{%x(rake db:seed)}"
      puts "cria admins ... #{%x(rake utils:generate_admins)}"
      puts "cria ads #{%x(rake utils:generate_ads)}"
      puts "cria membros #{%x(rake utils:generate_members)}"

      puts " ------------- setup executado com sucesso"
    end

  # CRIA ADMINS PARA O SISTEMA, COM NÍVELS E REGRAS 
  
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

  # CRIA FAKE MEMBERS

  desc "CRIANDO MEMBROS PARA O SITE"
  task generate_members: :environment do
    50.times do
      Member.create!(email: Faker::Internet.email,
                    # name: Faker::Name.name,
                    password: "123456",
                    password_confirmation: "123456"
                    )
    end
    puts "membros criados com sucesso "
  end

  # Criar anuncios falsos de modelo 

  desc "CRIAR FAKE ADS"
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

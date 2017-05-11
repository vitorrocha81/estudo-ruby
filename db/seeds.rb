puts "Criando as CATEORIRIAS"

categories = ["Animais",
			 				"Esportes",
			 				"Casa",
			 				"Eletrônicos",
			 				"Celulares",
			 				"Música",
			 				"Moda e beleza",
			 				"Veículos",
			 				"Imóveis",
			 				"Empregos",
			 				"Serviços",
			 				"Outros",
			 					]

categories.each do |category|
	Category.find_or_create_by(description: category)
end

puts "Categorias cadastradas com sucesso"

############### DEFAULT ADMIN ##################
 puts "CADASTRANDO ADMIN PADRÃO"

  Admin.create!(email: "vitor@vitor.com.br",
  							name: "Vitor adm geral",
  							password: "123456", password_confirmation: "123456",
  							role: 0)

puts "------>>> DADOS PADRÃO DO ADMIN! PEÇA AO VITOR!"
puts "___________________________________"
puts "ADMIN CRIADO COM SUCESSO PARÇA! :)" 
puts "___________________________________"


############### DEFAULT MEMBER ##################
 puts "CADASTRANDO MEU MEMBRO"

  Member.create!(email: "membro@vitor.com.br",
  							password: "123456",
  							password_confirmation: "123456")

puts "____________________________"
puts "MEMBRO CRIADO COM SUCESSO :)"

5.times do
	Ad.create!(title: Faker::Lorem.sentence(1),
	          description: Faker::Lorem.sentence([2,3,4,5,6].sample),
	          member: Member.first,
	          category: Category.all.sample,
	          price: "#{Random.rand(500)},#{Random.rand(99)}",
	          picture: File.new(Rails.root.join('public', 'templates', 'home', 'adsImages', "#{Random.rand(1...5)}.jpg"))
	          )
	end
puts "ADS CRIADOS COM SUCESSO"

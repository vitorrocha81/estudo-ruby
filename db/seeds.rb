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
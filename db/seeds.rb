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
class Backoffice::CategoriesController::CategoryService
	attr_accessor :category

	def self.create(category_params)
		@category = Category.new(category_params)
		if @category.valid?
			@category.save!
		end

		@category
	end
end
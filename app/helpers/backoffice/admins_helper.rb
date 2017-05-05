module Backoffice::AdminsHelper
	RolesForCollection = Struct.new(:id, :description)

	def options_for_roles
		# options = []

		# Admin.roles_i18n.each do |key, value|
		# 	options.push(RolesForCollection.new(key, value))
		# end
		
		# options
		 Admin.roles_i18n.map do |key, value|
		 	RolesForCollection.new(key, value)
		 end
	end
end

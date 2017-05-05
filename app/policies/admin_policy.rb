class AdminPolicy < ApplicationPolicy


	def new?
	user.full_access? || user.bills?
	end

	def permited_attributes
			if user.full_access?
				[:email, :password, :password_confirmation, :name, :role]
			else
				[:email, :password, :password_confirmation, :name]
			end
		
	end

	def edit?
	user.full_access? || user.bills?
	end

	def destroy?
	user.full_access?
	end

	class	Scope < Scope
		def resolve
			if user.full_access?
				scope.order(:name)
			else
				scope.restricted_acess
			end
		end
	end
end

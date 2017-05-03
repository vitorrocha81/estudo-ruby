class AdminPolicy < ApplicationPolicy

	def new?
	user.full_access? || user.bills?
	end

	def edit?
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

class Site::Profile::DashboardController < Site::ProfileController
	before_action :authenticate_member!
	
	def index
		#
	end
end

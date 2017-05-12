class Site::Profile::AdsController < Site::ProfileController

	before_action :authenticate_member!

  def index
  	@ads = Ad.where(member_id: current_member)
  end
end
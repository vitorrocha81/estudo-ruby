class Site::Profile::AdsController < Site::ProfileController

	before_action :authenticate_member!

  def index
  	@ads = Ad.where(member_id: current_member)
  end

  def show
  	@ad = Ad.find(params[:id])
  end

  def new
  	@ad = Ad.new
  end

  def create
  	@ad = Ad.create(ad_params)
  	if @ad.save
  		redirect_to  site_profile_ads_path  , notice: "Criado com sucesso"
  	else
  		render :new
  	end
  end

  private

  def ad_params
  	 params.require(:ad).permit(:price, :category_id, :description, :title, :picture)
  end

end
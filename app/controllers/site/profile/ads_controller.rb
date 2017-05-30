class Site::Profile::AdsController < Site::ProfileController
  before_action :set_profile, only: [:show, :edit, :update]

	before_action :authenticate_member!

  def index
  	@ads = Ad.where(member_id: current_member)
  end

  def show
  end

  def edit
  end

  def new
  	@ad = Ad.new
  end

  def create
  	@ad = Ad.create(ad_params)
    @ad.member = current_member
  	if @ad.save
  		redirect_to  site_profile_ads_path  , notice: "Criado com sucesso"
  	else
  		render :edit
  	end
  end

  def update
    if @ad.update(ad_params)
      # redirect_to  site_profile_ads_path  
      render :edit , notice: "Atualizado com sucesso"
    else
      render :edit
    end
  end
    

  private

  def set_profile
     @ad = Ad.find(params[:id])
  end

  def ad_params
  	 params.require(:ad).permit(:price, :category_id, :description, :title, :picture, :finish_date)
  end

end
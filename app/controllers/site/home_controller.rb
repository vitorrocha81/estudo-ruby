class Site::HomeController < ApplicationController
	layout "site"
	
  def index
  	@categories = Category.all
  	@ads = Ad.order(created_at: :desc).limit(5)
  end
end

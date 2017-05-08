class Backoffice::SendMailController < ApplicationController

	def edit
		@admin = Admin.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def create
		@admin = Admin.find(params[:id])
		respond_to do |format|
			format.js
		end
	end


# FIM DO BACKOFFICE SENDMAIL
end	


class Backoffice::SendMailController < ApplicationController

	def edit
		@admin = Admin.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	def create
		
		begin
			AdminMailer.admin_message(current_admin, params[:recipient], params[:subject], params[:adminMsg]).deliver_now
			@notify_message = "E-MAIL ENVIADO COM SUCESSO"
			@nofity_flag = 'danger'
		rescue  Exception => e
			e.message

			@notify_message = "erro eo enviar"
			@nofity_flag = 'danger'

			respond_to do |format|
				format.js { render layout: false}
			end
		end

	end

# FIM DO BACKOFFICE SENDMAIL
end	


class AdminMailer < ApplicationMailer
	
	def update_email(current_admin,admin)
		@current_admin = current_admin
		@admin = admin
		mail(to: @admin.email, subject: "Seus dados foram alterados!")
	end

	def admin_message(current_admin,recipient, subject, adminMsg)
		@current_admin = current_admin
		@recipient = recipient
		@subject = subject
		@adminMsg = adminMsg
		mail(to: @recipient,
				subject: @subject,
				body: "<html> <body>
							<strong> #{@recipient} </strong> lhe enviou um email.<br> 
							#{@adminMsg} </body> </html>",
				content_type: "html",
				charset: "UTF-8")
	end
end
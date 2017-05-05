class AdminMailerPreview < ActionMailer::Preview

	def update_email
			AdminMailer.update_email(Admin.last, Admin.first)
	end
end
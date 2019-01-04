class UserMailer < ApplicationMailer
default from: 'notification@gmail.com'
	def welcome_mailer(user)
		binding.pry
		user = user.email
		mail(to:user,subject:'testing application')
	end
end

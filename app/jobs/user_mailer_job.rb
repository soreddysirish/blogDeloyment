class UserMailerJob < ApplicationJob
	queue_as :default
	def perform(user)
		puts user.email
		UserMailer.welcome_mailer(user).deliver_later(wait: 2.minutes)
	end
end

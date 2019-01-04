class UsersController < ApplicationController
	caches_page :index
	caches_action :index
	def index
		@users = User.first(10)
		@users = @users.each(&append)
		@name = User.convert
	end

	def deliver
		user = User.find_by(email:'ssireeshreddy@gmail.com')
		UserMailerJob.perform_now(user)
	end

	def append
		lambda {|a| a.full_name = a.name+" Reddy"}
	end
end

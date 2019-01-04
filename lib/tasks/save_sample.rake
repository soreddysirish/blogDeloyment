require 'faker'
namespace :user do 
	task store_user: :environment do 
		1000.times do 
			user = User.new
			user.email = Faker::Internet.email
			user.name = Faker::Name.unique.name
			begin
				user.save!
			rescue Exception => e
				binding.pry
			end
		end
	end
end
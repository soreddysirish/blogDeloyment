class User < ApplicationRecord
	attr_accessor :full_name,:second_variable
	extend ListerExtension
	def self.convert
		hello("sirish")
	end
end

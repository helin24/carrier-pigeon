class User < ActiveRecord::Base
	belongs_to :delivery
	
	has_secure_password
end

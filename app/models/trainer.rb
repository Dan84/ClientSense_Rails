class Trainer < User

	has_many :appointments
	has_many :pt_clients, :through => :appointments

	def self.model_name
    User.model_name
  	end
  	
end

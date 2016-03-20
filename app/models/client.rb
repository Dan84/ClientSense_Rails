class Client < User

	has_many :appointments
	has_many :pt_trainers, :through => :appointments

	def self.model_name
    User.model_name
  	end
end

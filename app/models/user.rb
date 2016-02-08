class User < ActiveRecord::Base
	attr_accessor :remember_token

	has_many :exercise_classes, dependent: :destroy
	has_many :class_bookings
	has_many :attendances, :through => :class_bookings, :source => :exercise_class 
	has_many :articles, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :name, presence: true, length: {in: 4..30}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
			format: {with: VALID_EMAIL_REGEX},
			uniqueness: {case_sensitive: false}
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
	#validates :password_confirmation, presence: true
	has_secure_password

	before_save {|user| user.email = email.downcase}

	#Returns the hash digest of a string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt:: Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	#Returns a random token.
	def User.new_token
		SecureRandom.urlsafe_base64
	end

	# Remembers a suer in the database for use in persistent sessions.
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	#returns true if the given token matches the digest.
	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	#forgets a user
	def forget
		update_attribute(:remember_digest, nil)
	end

	def attending?(exerciseclass)
    	exerciseclass.participants.include?(self)
  	end

	def attend!(exerciseclass)
    	self.class_bookings.create!(exercise_class_id: exerciseclass.id)
  	end


  	def cancel!(exerciseclass)
    	self.class_bookings.find_by(exercise_class_id: exerciseclass.id).destroy
  	end

  	

end

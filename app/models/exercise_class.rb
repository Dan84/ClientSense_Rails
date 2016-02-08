class ExerciseClass < ActiveRecord::Base
	belongs_to :user
	belongs_to :class_style
	belongs_to :class_level
	has_many   :class_bookings
	has_many   :participants, :through => :class_bookings, :source => :user

	validates  :user_id, presence: true
	validates  :class_style_id, presence: true 
    validates  :class_level_id, presence: true 
    validates  :title, presence: true, length: {in: 5..25}
  	validates  :description, presence: true, length: {minimum: 10}
  	validates_date :date, :on_or_after => :today


  	scope :upcoming, -> { where("Date >= ?", Date.today).order('Date ASC') }
  	scope :past, -> { where("Date < ?", Date.today).order('Date DESC') }
         



  	
end

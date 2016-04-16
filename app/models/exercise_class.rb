class ExerciseClass < ActiveRecord::Base
	belongs_to :user
	belongs_to :class_style
	belongs_to :class_level
	has_many   :class_bookings, dependent: :destroy
	has_many   :participants, :through => :class_bookings, :source => :user
	has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates  :user_id, presence: true
	validates  :class_style_id, presence: true 
    validates  :class_level_id, presence: true 
    validates  :title, presence: true, length: {in: 5..25}
  	validates  :description, presence: true, length: {minimum: 10}
  	validates_date :date, :on_or_after => Time.now



  	scope :upcoming, -> { where("Date >= ?", Date.today).order('Date ASC') }
  	scope :past, -> { where("Date < ?", Date.today).order('Date DESC') }
         



  	
end

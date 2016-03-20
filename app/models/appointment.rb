class Appointment < ActiveRecord::Base
	belongs_to :trainer
	belongs_to :client

	validates :appointment_at, presence: true  
	validates :client_id, presence: true
	validates_date :appointment_at, :on_or_after => :today

	scope :unconfirmed, -> { where(confirmed: false) }
  	scope :confirmed, -> { where(confirmed: true) }
end

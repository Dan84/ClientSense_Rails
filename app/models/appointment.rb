class Appointment < ActiveRecord::Base
	belongs_to :trainer
	belongs_to :client

	validates :appointment_at, presence: true, uniqueness: true  
	validates :client_id, presence: true
	validates_datetime :appointment_at, :on_or_after => Time.now

  # Define scopes for confirmation status and upcoming or past
	scope :unconfirmed, -> { where(confirmed: false) }
  scope :confirmed, -> { where(confirmed: true) }

  scope :upcoming, -> { where("appointment_at >= ?", Time.now).order('appointment_at ASC') }
  scope :past, -> { where("appointment_at < ?", Time.now).order('appointment_at DESC') }

  	 def start_time
        self.appointment_at ##Where 'appointment_at' is a attribute of type 'Date' 
    end

    # Get Json values from 'Appointment' model to be used for calendar
    def as_json(options = {})
    {
      :id => self.id,
      :title => self.client.name,
      :start => self.appointment_at,
      :end => self.end_time
      
      
     }
     end
end

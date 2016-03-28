class Appointment < ActiveRecord::Base
	belongs_to :trainer
	belongs_to :client

	validates :appointment_at, presence: true  
	validates :client_id, presence: true
	validates_date :appointment_at, :on_or_after => :today

	scope :unconfirmed, -> { where(confirmed: false) }
  	scope :confirmed, -> { where(confirmed: true) }

  	 def start_time
        self.appointment_at ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
    end


    def as_json(options = {})
    {
      :id => self.id,
      :title => self.client.name,
      :start => self.appointment_at,
      :end => self.end_time
      
      
     }
     end
end

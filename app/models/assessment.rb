class Assessment < ActiveRecord::Base
  belongs_to :client
  belongs_to :trainer


  def self.search(search)
  	if search
  		where('client_name LIKE ?', "%#{search}%")
  	else
  		all
  	end
  end

  
end

class AppointmentsController < ApplicationController




	def new
		
		@appointment = Appointment.new
	end


	def create
		
		@start_time = params[:appointment][:appointment_at]
		params[:appointment][:end_time] = @start_time.to_datetime + 1.hour

		if(current_user.type == 'Trainer')
		secure_params = params.require(:appointment).permit(:appointment_at,:end_time, :confirmed, :trainer_id,:client_id)
		
		@appointment = Appointment.create!(secure_params) 

        if @appointment.save
          flash[:success] = "Class created!"
          redirect_to allappointments_path
        else
          
          render 'new'
        end  
        else(current_user.type == 'Client')	
        	secure_params = params.require(:appointment).permit(:appointment_at,:duration)

		@appointment = current_user.appointments.create!(secure_params) 
        if @appointment.save
          flash[:success] = "Class created, Awaiting confirmation"
          redirect_to root_path
        else
          
          render 'new'
        end  
    end
	end

	def edit

		@appointment = Appointment.find(params[:id])
		
	end


	def update
			@start_time = params[:appointment][:appointment_at]
			params[:appointment][:end_time] = @start_time.to_datetime + 1.hour
			
		    @appointment = Appointment.find(params[:id])
		    secure_params = params.require(:appointment).permit(:appointment_at,:end_time, :confirmed, :trainer_id,:client_id)
		    if @appointment.update_attributes(secure_params)
		      flash[:success] = "Appointment updated"
		      redirect_to @appointment
		    else
		      render 'edit'
		    end
  
	end

	
	def destroy
	   	@appointment = Appointment.find(params[:id]).destroy
	    flash[:success] = "Appointment deleted"
	    redirect_to allappointments_path
  	end


	def index
		@apps_confirmed = Appointment.confirmed
    	@apps_unconfirmed = Appointment.unconfirmed
	end

	def show
		@appointment = Appointment.find(params[:id])
	end



	private

	def user_type
		if (current_user.type == 'Trainer')
			trainer
		elsif (current_user.type == 'Client')
			client
			
		end
		
	end


	

	
end

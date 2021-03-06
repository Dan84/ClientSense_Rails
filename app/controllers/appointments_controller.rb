class AppointmentsController < ApplicationController
	#Check if user is logged in and restrict some actions for client
	before_filter :logged_in_user
  	before_action :is_user_trainer, only: [:edit, :uptate,:destroy,:show]
	respond_to :html, :json



	def new
		
		@appointment = Appointment.new
		respond_to do |format|
		      format.html
		      format.js
		    end
	end


	def create
		#Used to automatically add 1 hr to start time to calculate end time
		@start_time = params[:appointment][:appointment_at]
		params[:appointment][:end_time] = @start_time.to_datetime + 1.hour

		#Depending on the user type allow different params
		if(current_user.type == 'Trainer')
		secure_params = params.require(:appointment).permit(:appointment_at,:end_time, :confirmed, :trainer_id,:client_id)		
		@appointment = Appointment.create(secure_params)        
        else(current_user.type == 'Client')	
        	secure_params = params.require(:appointment).permit(:appointment_at,:duration)
		@appointment = current_user.appointments.create(secure_params)

		#Create notification for trainers when client creates an appointment
		Trainer.all.each do |trainer|
        Notification.create(recipient: trainer, actor: current_user, action: "requested an appointment.", url: allappointments_path)
        end			
		end 

		respond_to do |format|
      		if @appointment.save
      			format.html {redirect_to allappointments_path}
        		format.json { head :no_content }
        		format.js

      		else     			
      			
        		format.json { render json: @appointment.errors.full_messages, status: :unprocessable_entity }
        		format.js{@appointment.errors.full_messages}
        		
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
		      redirect_to allappointments_path
		      #Create a notification for client when appointment is confirmed
        	  Notification.create(recipient: @appointment.client, actor: current_user, action: "confirmed your appointment.", url: allappointments_path)
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
		@apps_confirmed = Appointment.confirmed.upcoming
    	@apps_unconfirmed = Appointment.unconfirmed.upcoming
    	respond_to do |format|
    	    format.html
    	    format.json { render json:@apps_confirmed.to_json }
    	  end
    	
	end

	def show
		@appointment = Appointment.find(params[:id])
	end



	private
	#finding the user type
	def user_type
		if (current_user.type == 'Trainer')
			trainer
		elsif (current_user.type == 'Client')
			client
			
		end
		
	end


	

	
end

class AssessmentsController < ApplicationController
  def new
  	@assessment = Assessment.new
  end

  def create
  	@client_name = Client.find(params[:assessment][:client_id]).name
  	params[:assessment][:client_name] = @client_name
  	secure_params = params.require(:assessment).permit(:client_id,:client_name,:weight, :bpsystolic, :bpdiastolic,:bodyfat,:notes, :trainer_id)
  	@assessment = Assessment.create!(secure_params) 
  	
        if @assessment.save
          flash[:success] = "assessment created!"
          redirect_to assessments_path
        else
          
          render 'new'
        end  
  end

  def index
  	@assessments = Assessment.search(params[:search]).all
     
  end

  def show

  	@assessment = Assessment.find(params[:id])
  end


  def destroy
	   	@assessment = Assessment.find(params[:id]).destroy
	    flash[:success] = "assessment deleted"
	    redirect_to assessments_path
  	end
end

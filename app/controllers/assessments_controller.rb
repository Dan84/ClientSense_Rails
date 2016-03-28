class AssessmentsController < ApplicationController
  before_filter :logged_in_user
  before_action :is_user_trainer, only: [:create, :edit, :uptate,:destroy,:index,:show]

  def new
  	@assessment = Assessment.new
  end

  def create
  	@client_name = Client.find(params[:assessment][:client_id]).name
  	params[:assessment][:client_name] = @client_name
  	secure_params = params.require(:assessment).permit(:client_id,:date,:client_name,:weight, :bpsystolic, :bpdiastolic,:bodyfat,:notes, :trainer_id)
  	@assessment = Assessment.create!(secure_params) 
  	@assessments = Assessment.all
        if @assessment.save
          #flash[:success] = "assessment created!"
          #redirect_to assessments_path
        else
          
          render 'new'
        end  
  end

  def index
  	@assessments = Assessment.search(params[:search]).all.order('date DESC')
     
  end

  def show

  	@assessment = Assessment.find(params[:id])
  end


  def destroy
	   	@assessment = Assessment.find(params[:id]).destroy
	    flash[:success] = "assessment deleted"
	    redirect_to assessments_path
  	end





  private
  
  
  def is_user_trainer
       unless current_user.trainer?
        redirect_to(root_url)
        flash[:danger] = "You do not have permission to view this page"
      end
  end 
end

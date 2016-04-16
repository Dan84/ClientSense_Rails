class ProgressController < ApplicationController
	 #Check if user is logged in 
	 before_filter :logged_in_user

  def index
  	    @user = User.find(current_user.id)
        @assessments = @user.assessments.order('date DESC')        
  end

  def show
  end
end

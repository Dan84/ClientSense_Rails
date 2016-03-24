class ProgressController < ApplicationController
  def index

  	    @user = User.find(current_user.id)
        @assessments = @user.assessments.order('date DESC')
		
        
  end

  def show
  end
end

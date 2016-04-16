class StaticPagesController < ApplicationController
  def home
  	@articles = Article.all
    #If the user is logged in retrieve upcoming appointments
    if logged_in? 
    @clientAppointments = current_user.appointments.upcoming.confirmed

    end
  end

  def help
  end

  def about
  	
  end


  def index

  	
  	
  end



end

class ClassBookingsController < ApplicationController
  def show
  end

  def index
  end

  def new
  end

  def create

  	@exerciseClass = ExerciseClass.find(params[:class_booking][:exercise_class_id])
  	
    current_user.attend!(@exerciseClass)
    redirect_to @exerciseClass
    

  end

  def destroy
    @exerciseClass = ClassBooking.find(params[:id]).exercise_class
    
    current_user.cancel!(@exerciseClass)
    redirect_to @exerciseClass
  end

  

end

class ClassBookingsController < ApplicationController
  def show
  end

  def index
  end

  def new
  end

  def create

  	@exerciseClass = ExerciseClass.find(params[:class_booking][:exercise_class_id])
  	#call method in user class to attend exercise class
    current_user.attend!(@exerciseClass)
    redirect_to @exerciseClass
    

  end

  def destroy
    @exerciseClass = ClassBooking.find(params[:id]).exercise_class
    #call method in user class to cancel exercise class attendance
    current_user.cancel!(@exerciseClass)
    redirect_to @exerciseClass
  end

  

end

class ProfilesController < ApplicationController
 #Check if user is logged in 
  before_filter :logged_in_user

  def edit
    @profile = User.find(params[:id]).profile
  end

  #As profile is created automatically for new user, only update action is needed
  def update
    @profile = Profile.find(params[:id])
      
    if @profile.update_attributes(secure_profile)
      @user = current_user;
      flash[:success] = "Profile updated successfully"
      redirect_to @user
    else
      flash[:error] = "Something happened"
      redirect_to edit_profile_path
    end
  end

  def show
    @user = User.find(params[:id])
    
    @profile = @user.profile    
  end 




   private
   #Profile parameters
    def secure_profile
    	params.require(:profile).permit(:gender,:dob,:phone,:goal,:targetweight,:occupation,:bio,:avatar)
    end
end

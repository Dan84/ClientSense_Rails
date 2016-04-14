class ProfilesController < ApplicationController
 # def show
  	#@profile = Profile.find(params[:id])
 # end


  #def new
  	#@profile = current_user.build_profile if current_user.profile.nil?
  	#respond_to do |format|
		     # format.html
		     # format.js
		    #end
  #end


  def edit
    @profile = User.find(params[:id]).profile
  end

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
    def secure_profile
    	params.require(:profile).permit(:gender,:dob,:phone,:goal,:targetweight,:occupation,:bio)
    end
end

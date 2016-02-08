class UsersController < ApplicationController
  before_filter :logged_in_user
  before_action :logged_in_user, only: [:read,:edit, :edit,:update]
  before_action :correct_user,   only: [:edit, :update]

	def show
        logged_in_user
        @user = User.find(params[:id])
        @bookings = @user.attendances
        @createdclasses = @user.exercise_classes
       # @articles = @user.articles.paginate(page: params[:page])
      end

  def index  

            if !logged_in?
                redirect_to login_url
              else
                @users = User.paginate(page: params[:page])
                
                  #@users = User.where("trainer" => true) 
                  
                end     
end

      
  def new
  	@user = User.new
  end





  def create

  	#secure_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)


  	@user = User.new(user_params)
  	if @user.save
      remember @user
      flash[:success] = "Welcome !"   
  		redirect_to @user
  	   else
		        render 'new'

	   end
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end



  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end





  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end



    



end

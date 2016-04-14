class UsersController < ApplicationController
  before_filter :logged_in_user
  before_action :logged_in_user, only: [:read,:edit, :edit,:update]
  before_action :correct_user,   only: [:edit, :update]
  respond_to :html, :json

	def show
        logged_in_user
        @user = User.find(params[:id])
        @bookings = @user.attendances
        @createdclasses = @user.exercise_classes
        @profile = @user.profile

        respond_to do |format|
        format.html {@user}
        format.js {@user}
        format.json {render json: @user.to_json}
      end
       # @articles = @user.articles.paginate(page: params[:page])
      end

  def index  

            if !logged_in?
                redirect_to login_url
              else
                @users = User.all.where.not(id: current_user.id).paginate(page: params[:page])
                @conversations = Conversation.involving(current_user).order("created_at DESC")
                @trainers = User.trainers.where.not(id: current_user.id).paginate(page: params[:page])
                @clients = User.clients.where.not(id: current_user.id).paginate(page: params[:page])

                respond_to do |format|
                  format.html {@users}
                  format.json {render json: @users}
                end
                
                  #@users = User.where("trainer" => true) 
                  
                end     
end

      
  def new
  	@user = User.new
    @user.type = params[:user_type]
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



  def change_type
    @user = User.find(params[:id])
    @user
    if @user.save
      flash[:success] = "Account updated"
      redirect_to users_url
      else
        flash[:success] = "Account not updated"
      redirect_to users_url
    end
  end





  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:type)
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

    def user_type
      params[:type].capitalize
    end

    def sti_type_is_trainer
      if self.type? == 'Trainer'
        true
      else
        false
      end
    end


    



end

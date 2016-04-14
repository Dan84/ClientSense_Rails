class SessionsController < ApplicationController
  respond_to :html, :json
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      remember user
  		respond_to do |format|
        format.html {redirect_to user}
        format.json {render json: user}
        format.js {user }
        end

  	else
      format.html { render :new, flash.now[:danger] = 'Invalid email/password combination' }
      format.json { render json: user.errors, status: :unprocessable_entity }
  		
  		render 'new'
  	end
  end

  def destroy
        log_out if logged_in?
        redirect_to root_url
      end 

end

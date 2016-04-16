class SessionsController < ApplicationController
  respond_to :html, :json
  def new
  end

  def create
    #Create a new session when logging in json returned for Ionic app
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      remember user
  		respond_to do |format|
        format.html {redirect_to user}
        format.json {render json: user}
        format.js {user }
        end

  	else
      respond_to do |format|
      format.html { flash.now[:danger] = 'Invalid email/password combination' }
      format.json { render json: user.errors, status: :unprocessable_entity }
  		end
  		render 'new'
  	end
  end

  def destroy
        log_out if logged_in?
        redirect_to root_url
      end 

end

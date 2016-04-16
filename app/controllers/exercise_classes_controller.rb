class ExerciseClassesController < ApplicationController
  #Check if user is logged in and restrict some actions for client
  before_filter :logged_in_user
  before_action :is_user_trainer, only: [:create, :edit, :uptate,:destroy]
  respond_to :html, :json
  
  def show
  	@exerciseclass = ExerciseClass.find(params[:id])
  end

  def index

  	@exerciseclasses = ExerciseClass.all
    #Using scope from the model to find classes upcoming
    @classes_upcoming = ExerciseClass.upcoming.paginate(page: params[:upcoming])
    @classes_past = ExerciseClass.past.paginate(page: params[:past])

    respond_to do |format|

          format.html {@classes_upcoming}
          format.js {@classes_upcoming}
    end

  end

  def create
  	#Build exercise class related to trainer who creates it
        @exerciseclass = current_user.exercise_classes.build(secure_exclass) 
        @classes_upcoming = ExerciseClass.upcoming.paginate(page: params[:upcoming])        

        respond_to do |format|
          if @exerciseclass.save
            format.html {redirect_to exercise_classes_path}
            format.json { head :no_content }
            format.js

          else          
            format.html 
            format.json { render json: @exerciseclass.errors.full_messages, status: :unprocessable_entity }
            format.js{@exerciseclass.errors.full_messages}
            
          end
        end  	
  end


  def new
    is_user_trainer
  	@exerciseclass = ExerciseClass.new
    
  end

  def update
      @exerciseclass = ExerciseClass.find(params[:id])
      #if @exerciseclass.update_attributes(secure_exclass)
         #flash[:success] = "Class Updated"
         #redirect_to @exerciseclass
     # else
        #render action: "edit"
      #end
      
      respond_to do |format|
          if @exerciseclass.update_attributes(secure_exclass)
            format.html {redirect_to @exerciseclass}
            format.json { head :no_content }
            format.js

          else          
            
            format.json { render json: @exerciseclass.errors.full_messages, status: :unprocessable_entity }
            format.js{@exerciseclass.errors.full_messages}
            end
          end
  end


  def edit
    @exerciseclass = ExerciseClass.find(params[:id])
  end

  def destroy

    ExerciseClass.find(params[:id]).destroy
        flash[:success] = "Class deleted"
        redirect_to exercise_classes_path
                  
 end

#exercise class params
 def secure_exclass
      params.require(:exercise_class).permit(:title,:description,:class_style_id,:class_level_id,:date,:image)
 end


 def is_user_trainer
         unless current_user.trainer?
          redirect_to(root_url)
          flash[:danger] = "You do not have permission to view this page"
        end
    end 


end

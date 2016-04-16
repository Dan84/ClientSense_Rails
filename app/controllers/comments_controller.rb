class CommentsController < ApplicationController
  #Check if user is logged in and correct user to allow them to delete their own comment
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy
  def index
  end


  def create

  	 
  		@article = Article.find(params[:comment][:article_id])
        @comment = current_user.comments.build(secure_comment) 
        if @comment.save
          flash[:success] = "Comment added"
          redirect_to @article
        else
        	@discussion_comments = []
          flash[:danger] = "Comment failed"
          redirect_to @article
          end

        end


   def destroy
       Comment.find(params[:id]).destroy
       redirect_to :back
   end


   def secure_comment
  		params.require(:comment).permit(:content, :article_id)
   end

   def correct_user
       @comment = current_user.comments.find_by(id: params[:id])
       #redirect_to root_url if @micropost.nil?
   end
 
end

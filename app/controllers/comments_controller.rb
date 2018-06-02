class CommentsController < ApplicationController

  before_action :require_login, only: [:destroy, :create]

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])
    @comment = @vinyl.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to vinyl_path(@vinyl)
    end
  end

  def destroy
    @vinyl = Vinyl.find(params[:vinyl_id])
    current_user.comments.find(params[:id]).destroy
    redirect_to vinyl_path(@vinyl)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to comment"
      redirect_to "/auth/google_oauth2" # halts request cycle
    end
  end
end
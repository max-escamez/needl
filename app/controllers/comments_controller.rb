class CommentsController < ApplicationController

  before_action :require_login, only: [:destroy, :create]

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])

    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end
    @comment.vinyl_id = @vinyl.id
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
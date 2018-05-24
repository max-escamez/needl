class CommentsController < ApplicationController

  #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @vinyl = Vinyl.find(params[:vinyl_id])
    @comment = @vinyl.comments.create(comment_params)
    redirect_to vinyl_path(@vinyl)
  end

  def destroy
    @vinyl = Vinyl.find(params[:vinyl_id])
    @vinyl.comments.find(params[:id]).destroy
    redirect_to vinyl_path(@vinyl)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

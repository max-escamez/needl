class VinylsController < ApplicationController

  before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :upvote, :downvote]

  def index
    #@vinyls = Vinyl.all
    @vinyls = Vinyl.where(nil)
    if params[:filter] == "vote"
      @vinyls = @vinyls.sort_by_votes
    elsif params[:filter] == "date"
      @vinyls = @vinyls.sort_by_dates
    elsif params[:filter] == "search"
      @vinyls = @vinyls.artist_starts_with("Lee")
      @vinyls = @vinyls.album_starts_with("Twist")
    elsif params[:filter] == "submissions"
      @vinyls = @vinyls.user_submissions(params[:user_id])
    elsif params[:filter] == "following"
      @vinyls = @vinyls.user_following(params[:user_id])
    end
  end

  def show
    @vinyl = Vinyl.find(params[:id])
    @comments = @vinyl.comments.hash_tree(limit_depth: 2)
  end

  def new
    @vinyl = Vinyl.new
  end

  def edit
    @vinyl = Vinyl.find(params[:id])
  end

  def create
    @vinyl = current_user.vinyls.new(vinyl_params)
    @vinyl.votes=0
    if @vinyl.save
      redirect_to @vinyl
    else
      render 'new'
    end
  end

  def update
    if current_user.vinyls.find(params[:id]).update(vinyl_params)
      redirect_to @vinyl
    else
      render 'edit'
    end
  end

  def destroy
    current_user.vinyls.find(params[:id]).destroy
    redirect_to vinyls_path
  end

  def upvote
    @vinyl = Vinyl.find(params[:id])
    @vinyl.upvote_by current_user
    @vinyl.update(votes: @vinyl.get_upvotes.size)
    redirect_to @vinyl
  end

  def downvote
    @vinyl = Vinyl.find(params[:id])
    @vinyl.downvote_by current_user
    @vinyl.update(votes: @vinyl.get_upvotes.size)
    redirect_to @vinyl
  end

  private
  def vinyl_params
    params.require(:vinyl).permit(:album_title,:artist,:description,:image)
  end

  private
  def require_login
    unless current_user
      flash[:error] = "You must be logged in to submit a vinyl"
      redirect_to "/auth/google_oauth2" # halts request cycle
    end
  end

end

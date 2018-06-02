class VinylsController < ApplicationController

  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @vinyls = Vinyl.all
  end

  def show
    @vinyl = Vinyl.find(params[:id])
  end

  def new
    @vinyl = Vinyl.new
  end

  def edit
    @vinyl = Vinyl.find(params[:id])
  end

  def create
    @vinyl = current_user.vinyls.new(vinyl_params)

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

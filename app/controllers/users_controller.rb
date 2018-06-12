class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @vinyls = Vinyl.where(nil)
    if params[:filter] == "following"
      votes=@user.votes.where(vote_flag: 1).order(updated_at: :desc).up.votables
      @vinyls = @vinyls.where(:id => votes).order_as_specified(:id => votes)
    else
      @vinyls = @vinyls.user_submissions(@user.id)
    end
  end
end

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    id=@user.id
    #could we grab specific vinyls or just stick to all of them ?
    @vinyls = Vinyl.where(nil)
    if params[:filter] == "following"
      @vinyls = @vinyls.user_following(id)
    else
      @vinyls = @vinyls.user_submissions(id)
    end
  end

end

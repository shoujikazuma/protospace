class UsersController < ApplicationController

  def edit
  end

  def index
  end

  def show
    user = User.find(params[:id])
    @email = user.email
    @id = user.id
    @avatar = user.avatar
    @profile = user.profile
    @member = user.member
    @work =user.works
    @nickname = user.nickname
  end
  
end

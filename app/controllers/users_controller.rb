class UsersController < ApplicationController

  before_action :authenticate_user! ,only: [:show, :update, :edit]

  def edit
    @user = User.find(params[:id])
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

def update
    if current_user.update(update_params)
       sign_in(current_user, bypass: true)
       redirect_to user_url(current_user) , flash: { success: 'Yes!! Success' }
     else
       redirect_to edit_user_path(current_user), alert: 'All forms can\'t be blank'
     end
end

private
  def user_params
    params.permit(:works,:profile,:member,:password,:avatar,:nickname)
  end
  def update_params
    params.require(:user).permit(:works,:profile,:member,:password,:avatar,:nickname)
  end
end


# class UsersController < ApplicationController

#   before_action :authenticate_user! ,only: [:show, :update, :edit]

#   def edit
#     @user = User.find(params[:id])
#   end

#   def index
#   end

#   def show
#     @user = User.find(params[:id])
#   end

#   def update
#     if current_user.update(update_params)
#        sign_in(current_user, bypass: true)
#        redirect_to user_url(current_user) , flash: { success: 'Yes!! Success' }
#      else
#        redirect_to edit_user_path(current_user), alert: 'All forms can\'t be blank'
#      end
#   end

# private
#   def user_params
#     params.permit(:works,:profile,:member,:password,:avatar,:nickname)
#   end
#   def update_params
#     params.require(:user).permit(:works,:profile,:member,:password,:avatar,:nickname)
#   end
# end

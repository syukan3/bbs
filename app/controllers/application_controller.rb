class ApplicationController < ActionController::Base
#  before_action :set_current_user
  before_action :set_guest_user

#  def set_current_user
#    @current_user = User.find_by(id: session[:user_id])
#  end

 def authenticate_guest_user
   if current_user
     if current_user.name == "Guest"
       flash[:notice] = "Guestユーザーではアクセスできません。"
       redirect_to("/")
     end
   end
 end

  def set_guest_user
    @guest = User.find_by(id: session[:guest_id])
  end

end

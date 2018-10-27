class WelcomeController < ApplicationController
  def index
  end

  def guest_login
    @guest = Welcome.new(guest: true)
#    @guest = User.new(name: "Guest", guest: true)
    @guest.save
    session[:guest_id] = @guest.id
    flash[:notice] = "ゲストユーザーとしてログインしました。"
    redirect_to("/")
  end

  def guest_logout
    @guest = Welcome.find_by(id: session[:guest_id])
#    @guest = User.find_by(name: "Guest",)
    @guest.destroy
    session[:guest_id] = nil
    flash[:notice] = "ゲストユーザーをログアウトしました。"
    redirect_to("/")
  end

end

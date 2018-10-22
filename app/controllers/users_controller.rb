class UsersController < ApplicationController
#  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
#  before_action :ensure_correct_user, {only: [:edit, :update]}

#  def ensure_correct_user
#    if @current_user.id != params[:id].to_i
#      flash[:notice] = "権限がありません。"
#      redirect_to("/users/index")
#    end
#  end


  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      render("users/signup")
    end

  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    if @user.save
      flash[:notice] = "編集しました。"
      @user.avatar.attach(params[:avatar])
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = current_user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました。"
      redirect_to("/users/index")
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to("/login")
  end

end

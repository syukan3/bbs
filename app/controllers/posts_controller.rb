class PostsController < ApplicationController
#  before_action :authenticate_user
#  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

#  def ensure_correct_user
#    if @current_user.id != params[:id].to_i
#      flash[:notice] = "権限がありません。"
#      redirect_to("/users/index")
#    end
#  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content: params[:content], user_id: current_user.id)
    if @post.save
      flash[:notice] ="投稿しました。"
      redirect_to(posts_path)
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました。"
      redirect_to(posts_path)
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    flash[:notice] = "投稿を削除しました。"
    redirect_to(posts_path)
  end

end

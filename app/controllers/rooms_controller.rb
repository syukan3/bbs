class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
#    @room = @user.posts.create(content: params[:content])
    @room = Room.new(room_name: params[:room_name], create_user_id: current_user.id)
    if @room.save
      flash[:notice] ="ルームを作成しました。"
      redirect_to(rooms_path)
    else
      flash[:notice] ="ルーム作成NG"
      render("rooms/new")
    end
  end

  def show
    @room = Room.find_by(id: params[:id])
    @posts = @room.posts.all
#    @user = @room.user
  end

  def edit
    @room = Room.find_by(id: params[:id])
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.room_name = params[:room_name]
    if @room.save
      flash[:notice] = "ルームを編集しました。"
      redirect_to(rooms_path)
    else
      render("rooms/edit")
    end
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to(rooms_path)
  end


end

class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new(room_id: params[:id], user_id: current_user.id)
    if @member.save
      flash[:notice] ="ルームに入りました。"
      redirect_to("/rooms/:id")
    else
      flash[:notice] ="ルームに入れませんでした。"
      render(room_path)
    end
  end

  def create
#    @room = @user.posts.create(content: params[:content])
    @member = Member.new(room_name: params[:room_name], create_user_id: current_user.id)
    if @member.save
      flash[:notice] ="メンバーを作成しました。"
      redirect_to(members_path)
    else
      flash[:notice] ="ルーム作成NG"
      render("members/new")
    end
  end

  def show
    @member = Member.find_by(id: params[:id])
    @user = @post.user
  end

  def edit
    @member = Member.find_by(id: params[:id])
  end

  def update
    @member = Member.find_by(id: params[:id])
    @member.content = params[:content]
    if @member.save
      flash[:notice] = "ルームを編集しました。"
      redirect_to(members_path)
    else
      render("members/edit")
    end
  end

  def destroy
    @member = Member.find_by(room_id: params[:id], user_id: current_user.id)
    @member.destroy
    flash[:notice] = "ルームから出ました。"
    redirect_to(room_path)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users=User.all
  end

  def following
    # アクションの実装
  end 

  def show
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
      @msg ="他のユーザーとDMしてみよう！"
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
    end
        
  end

  if @isRoom != true
    @room = Room.new
    @entry = Entry.new
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end


 end
 end
end

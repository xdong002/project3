class RoomController < ApplicationController
  def index
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @rooms = Room.all
    @room = Room.find_by_id(params[:id])
  end

  def new
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @room = Room.new
  end

  def create
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @room = Room.create(room_params)
    redirect_to rooms_path
  end

  def show
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @room = Room.find_by_id(params[:id])
    @topics = @room.topics
  end

  def edit
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @room = Room.find_by_id(params[:id])
  end

  def update
    @room = Room.find_by_id(params[:id])
    @room.update_attributes(params.require(:room).permit(:name, :description, :icon))
    if @room.save
      redirect_to '/'
    end
  end

  def destroy
    @room = Room.find_by_id(params[:id])
    @room.destroy
    redirect_to '/'
  end

  private

  def room_params
    params.require(:room).permit(:name, :description)
  end
end

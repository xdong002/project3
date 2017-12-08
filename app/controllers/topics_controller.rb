class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
  end

  def new
    @topic = Topic.new
  end

  def create
    @room = Room.find_by_id(params[:id])
    @topic = Topic.new(topic_params)
    @topic.owner_id = current_user.id.to_s
    @topic.owner_name = current_user.username
    current_user.topics << @topic
    if @topic.save
      redirect_to room_path(@topic.room_id)
    end
  end

  def show
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @topic = Topic.find_by_id(params[:id])
    @comments = @topic.comments
  end

  def edit
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end

    @topic = Topic.find_by_id(params[:id])
    if (current_user.id.to_s != @topic.owner_id)
      flash[:error] = 'Stop Hacking!'
      redirect_to '/'
    end
  end

  def update
    @topic = Topic.find_by_id(params[:id])
    @topic.update_attributes(topic_params)
    if @topic.save
      redirect_to @topic
    end
  end

  def destroy
    @topic = Topic.find_by_id(params[:id])
    @topic.destroy
    flash[:notice] = "#{@topic.title} has been deleted"
    redirect_to room_path(@topic.room_id)
  end


  private

  def topic_params
    params.require(:topic).permit(:title, :content, :room_id)
  end
end

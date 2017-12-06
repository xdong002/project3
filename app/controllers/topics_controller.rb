class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    @user = current_user
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.owner_id = current_user.id.to_s
    @topic.owner_name = current_user.username
    current_user.topics << @topic
    if @topic.save
      redirect_to topics_path
    end
  end

  def show
    @topic = Topic.find_by_id(params[:id])
  end

  def edit
    @topic = Topic.find_by_id(params[:id])

  end

  def update
    @topic = Topic.find_by_id(params[:id])
    @topic.update_attributes(topic_params)
    redirect_to topics_path(@topic)
  end

  def destroy
    @topic = Topic.find_by_id(params[:id])
    @topic.destroy
    flash[:notice] = "#{@topic.title} has been deleted"
    redirect_to topics_path
  end


  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end

class TopicsController < ApplicationController
  def index
    @topics = Topic.all
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


  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end
end

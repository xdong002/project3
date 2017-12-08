class CommentsController < ApplicationController
  def index
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @comments = Comment.all
  end

  def new
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @comment = Comment.new
  end

  def create
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @comment = current_user.comments.new(commentParams)
    @comment.owner_id = current_user.id.to_s
    @comment.owner_name = current_user.username
    if @comment.save
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end

    @comment = Comment.find_by_id(params[:id])
    if (current_user.id.to_s != @comment.owner_id)
      flash[:error] = 'Stop Hacking!'
      redirect_to '/'
    end
  end

  def show
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @comment = Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.update_attributes(params.require(:comment).permit(:content))
    if @comment.save
      redirect_to topic_path(@comment.topic_id)
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    redirect_to topic_path(@comment.topic_id)
  end

  private

  def commentParams
    params.require(:comment).permit(:content, :topic_id)
  end
end

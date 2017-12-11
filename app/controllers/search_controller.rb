class SearchController < ApplicationController

  def search
    redirect_to search_result_path(search_params[:search])
  end

  def show
    if current_user == nil
      @user = User.new
    else
      @user = current_user
    end
    @search_topics = []
    @search_comments = []


    Topic.all.each do |t|
      if t.title.include? params[:search]
        @search_topics << t
      end
    end

    Comment.all.each do |c|
      if c.content.include? params[:search]
        @search_comments << c
      end
    end

  end

  private

  def search_params
    params.permit(:search)
  end
end

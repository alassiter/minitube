class VideosController < ApplicationController
  def index
    @videos = Video.all(:include => {:releases => [:country,:policy]})
  end

  def show
    @video = Video.find(params[:id])
  end
end

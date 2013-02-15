class VideosController < ApplicationController
  def index
    # @videos = Video.all(:include => {:releases => [:country,:policy]})
    @releases = Release.joins(:video,:country,:policy).select("
        releases.id,videos.id as vid, videos.name as vname, countries.name as cname, policies.id as pid")

    @videos = @releases.group_by
  end

  def show
    @video = Video.find(params[:id])
  end
end

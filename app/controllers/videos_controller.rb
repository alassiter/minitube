class VideosController < ApplicationController
  def index
    # @videos = Video.all(:include => {:releases => [:country,:policy]})
    releases = Release.all
    videos = releases.group_by{|r| {'vid' => r.vid, 'vname' => r.vname}}
    grouped = {}
    videos.each do |k,v|
        grouped[k["vid"]] = {"name" => k["vname"], "releases" => v.group_by(&:pid)}
    end
    @policies = Policy.all
    @videos = grouped
  end

  def show
    @video = Video.find(params[:id])
  end
end

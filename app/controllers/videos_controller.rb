class VideosController < ApplicationController
  def index
    # @videos = Video.all(:include => {:releases => [:country,:policy]})
    releases = Release.all
    videos = releases.group_by{|r| {'vid' => r.vid, 'vname' => r.vname}}
    grouped = {}
    videos.each do |k,v|
        grouped[k["vid"]] = {"name" => k["vname"], "releases" => v.group_by{|r| r.pid.to_s}}
    end
    @policies = Policy.all
    @videos = grouped.first(10)
  end

  def show
    @video = Video.find(params[:id])
    @country = Country.where(:code => params[:code].upcase).first
    release = Release.where({:video_id => @video, :country_id => @country}).first
    unless release.blank?
      @policy = release.policy
    end

    if @policy.blank?
      flash.now[:notice] = "No Policy was found for that country"
    end
  end
end

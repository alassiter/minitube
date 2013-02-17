class CountriesController < ApplicationController
  def show
    @country = Country.where("code = ?", params[:id]).first
    @releases = Release.includes(:video).from_country(@country).page params[:page]
  end
end

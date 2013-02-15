class Video < ActiveRecord::Base
  has_many :releases
  has_many :countries, through: :releases
  attr_accessible :name

  def self.releases
      joins(:releases => [:policy, :country]).select("videos.id,videos.name,policies.id,countries.code").group("videos.id,policies.id").order("videos.id,countries.code")
  end
end

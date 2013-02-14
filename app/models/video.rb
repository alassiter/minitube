class Video < ActiveRecord::Base
  has_many :releases
  has_many :countries, through: :releases
  attr_accessible :name
end

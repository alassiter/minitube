class Policy < ActiveRecord::Base
    has_many :releases
    has_many :videos, through: :releases
  attr_accessible :name
end

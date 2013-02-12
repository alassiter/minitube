class Country < ActiveRecord::Base
    has_many :releases
    has_many :videos, through: :releases
  attr_accessible :code, :name

  validates_presence_of :name
  validates_presence_of :code
end

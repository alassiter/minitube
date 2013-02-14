class Release < ActiveRecord::Base
    belongs_to :country
    belongs_to :policy
    belongs_to :video
    attr_accessible :country_id, :policy_id, :video_id

    scope :blocked, lambda { where(:policy_id => 1) }
    scope :free, lambda { where(:policy_id => 2) }
    scope :monetize, lambda { where(:policy_id => 3) }
end

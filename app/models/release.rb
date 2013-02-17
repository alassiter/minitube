class Release < ActiveRecord::Base
    belongs_to :country
    belongs_to :policy
    belongs_to :video
    attr_accessible :country_id, :policy_id, :video_id

    scope :blocked, lambda { where(:policy_id => 1) }
    scope :free, lambda { where(:policy_id => 2) }
    scope :monetize, lambda { where(:policy_id => 3) }

    scope :from_country, lambda {|country_id| where("country_id = ?",country_id)}

    def self.all
        # redefining all method on this model.
        @releases = Release.joins(:video,:country,:policy).select("
            releases.id,videos.id as vid, videos.name as vname, countries.code as country, releases.country_id as cid, policies.id as pid").order("vid")
    end
end

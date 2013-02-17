module VideosHelper
    def country_link(release,country_idx)
        country = (country_idx == 0 ? release['country'] : " - " + release['country'])
        link_to country, country_path(release['country'])
    end
end

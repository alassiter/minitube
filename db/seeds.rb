# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating Policies ...\n"
Policy.create(:name => "Free")
Policy.create(:name => "Monetize")
Policy.create(:name => "Block")

puts "Creating Countries...\n"
Country.create(:name => "United States", :code => "US")
Country.create(:name => "Canada", :code => "CA")
Country.create(:name => "Mexico", :code => "MX")
Country.create(:name => "China", :code => "CN")
Country.create(:name => "Taiwan", :code => "TW")
Country.create(:name => "India", :code => "IN")

100.times do |i|
    video = Video.create!(:name => "Vid")
    if video.id < 11
        video.name = video.name + "0" + i.to_s
    else
        video.name = video.name + i.to_s
    end
    country_array = (1..6).to_a
    country_array.shuffle[0..2].each do |cid|
        video.releases << Release.create(:policy_id => (1+rand(3)), :country_id => cid)
    end
    video.save
    puts "Video #{video.name} created for #{video.releases.map{|r| r.country_id}}"
end

video_id_array = (0..99).to_a
Country.all.each do |country|
    video_id_array.shuffle[0..32].each do |vid|
        vid
    end
end

# require library
# find url
# open url
# parse url
# search for elements , create array of hashes
# write back to csv

require 'csv'
require 'open-uri'
require 'nokogiri'

url = 'http://blog.feedspot.com/lifestyle_blogs/'

file = open(url).read
doc = Nokogiri::HTML(file)

lifestyle_blogs = []

doc.search('.trow').each do |blog_row|
  title = blog_row.css('.tlink').text.strip
  webpage = blog_row.css('.data').text.strip
  facebook = blog_row.css('.stats[1]').text.strip
  twitter = blog_row.css('.stats[2]')


  blog = {
    title: title,
    webpage: webpage,
    facebook: facebook,
    twitter: twitter,
  }

  lifestyle_blogs << blog unless blog[:title].empty?
end
# result_titles = doc.search(".title")
# result_artist = doc.search(".artist")
# result_position = doc.search(".position")

# artists = result_artist.map do |result|
#   result.text.strip
# end

# positions = result_position.map do |result|
#   result.text.strip
# end

# titles = result_titles.map do |result|
#   result.text.strip
# end

# music_chart = []

# titles.each_with_index do |value, index|
#   song = {
#     title: value,
#     artist: artists[index],
#     position: positions[index]
#   }
#   music_chart << song
# end

CSV.open('blogs.csv','w') do |csv|
  lifestyle_blogs.each do |blog|
    csv << [blog[:title], blog[:webpage], blog[:facebook], blog[:twitter]]
  end
end

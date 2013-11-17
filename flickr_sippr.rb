require 'nokogiri'
require 'uri'
require 'open-uri'

set_url = ARGV[0]

set_page = Nokogiri::HTML(open(set_url))

set_page.css('//a.photo-click').each do |link|
  image_url = "http://flickr.com/" + link.attribute('href').to_s 

  image_page = ''
  open(image_url) do |f|
    image_page = f.read
  end
  
  location = (image_page =~ /http:\/\/farm.*\.staticflickr\.com\/.*_o.jpg/)
  if (location)
    roughly = image_page[location, 80]
    real_image_url = roughly[0, roughly.index('[')]
    puts real_image_url
  end
end

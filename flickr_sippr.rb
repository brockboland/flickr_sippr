require 'nokogiri'
require 'uri'
require 'open-uri'
require 'fileutils'

# Get the set URL from the path
set_url = ARGV[0]

if (!set_url)
  puts "Call this script with a set URL"
  abort()
end

if (!File.directory?('images'))
  FileUtils.mkdir_p('images')
end


# Find the page listing all images in the set
set_page = Nokogiri::HTML(open(set_url))

# Loop over each photo in the set
set_page.css('//a.photo-click').each do |link|
  image_url = "http://flickr.com/" + link.attribute('href').to_s 

  # Load the full page for the individual image
  image_page = ''
  open(image_url) do |f|
    image_page = f.read
  end

  # Find the "Original" size image URL somewhere in the page JS
  real_image_url = image_page.scan(/http:\/\/farm.*\.staticflickr\.com\/.*_o.jpg/).first
  if (real_image_url)
    # Pull down the image
    system("wget -P images " + real_image_url)
  end
end

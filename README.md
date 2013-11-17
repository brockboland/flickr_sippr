The script will loop over each image shown on the set page, and download the original size of each image into an images subdirectory.

## Warning
This script is a total hack, and does not work with private sets. I have not tested it with sets that span multiple pages.

## Setup
Requires the [Nokogiri gem](http://nokogiri.org/) which can be installed thusly:

    sudo gem install nokogiri

## Usage
Run the script with a Flickr set URL

    ruby flickr_sippr.rb http://www.flickr.com/photos/brockli/sets/72157633360427215/

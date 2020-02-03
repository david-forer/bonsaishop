require_relative "../lib/bonsaishop/version.rb"
require_relative "../lib/bonsaishop/cli.rb"
require_relative "../lib/bonsaishop/scraper.rb"
require_relative "../lib/bonsaishop/bonsai.rb"
require_relative "../lib/bonsaishop/bonsaiplant.rb"


require 'nokogiri'
require 'pry'
require 'open-uri'

module Bonsaishop
  class Error < StandardError; end
  # Your code goes here...
end
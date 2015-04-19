#!/usr/bin/env ruby

require 'mechanize'

unless ARGV[0]
  puts "Usage: ms15_034_check.rb http://url_to_test"
  exit 1
end

if ARGV[0].match 'http'
	URL = ARGV[0]
else
	URL = "http://#{ARGV[0]}"
end

request = Mechanize.new
head = Hash.new
head = { 'Range' => 'bytes=0-18446744073709551615' }
begin
page = request.get(URL, parameters = nil, referer = nil, headers = head)
rescue Mechanize::ResponseCodeError => exception
  if exception.response_code == '416'
  	page2 = request.get(URL)
    header2 = page2.header.to_s
    if header2.match 'IIS'
  	  puts "\e[31mLooks Vulnerable.\e[0m"
  	  exit
  	else
  	  puts "\e[31mMaybe, got a 416 error but doesn't look like an IIS server.\e[0m"	
  	  exit
  	end
  end	
rescue 
  puts "\e[34mGot an unexpected error check the url.\e[0m"
  exit
end

header = page.header.to_s
if header.match 'IIS'
	if header.match 'The request has an invalid header name'
		puts "\e[32mLooks Patched.\e[0m"
	else
		puts "\e[34mLooks like IIS but can't tell if vulnerable or patched.\e[0m"
	end
else
	puts "\e[34mNot an IIS Server.\e[0m"
end

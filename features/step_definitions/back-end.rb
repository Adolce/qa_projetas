 #encoding: utf-8
 # !/usr/bin/env ruby
 # features/step_definitions/back-end.rb

require 'httparty'

When(/^client requests GET (.*)$/) do |path|
  @last_response = HTTParty.get('http://correiosapi.apphb.com/cep/ +path)
end

Then /^the response should be JSON:$/ do |json|
   JSON.parse(@last_response.body).should == JSON.parse(json)
   puts response.code
   puts response.message
end

When(/^client requests GET (.*)$/) do |path|
  @last_response = HTTParty.get('http://correiosapi.apphb.com/cep/01111000)
  
end

Then /^the response should be a Content-Type of 'text/xml'/ do |xml|
   XML.parse(@last_response.body).should == XML.parse(xml)
   puts response.code
   puts response.message
end

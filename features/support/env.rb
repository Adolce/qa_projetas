 require 'capybara'
 require 'gherkin'
 require 'rescue'
 require 'json'
 require 'selenium-webdriver'
 require 'rspec'
 require 'httparty'
 require 'bundler'
 require 'rails'
require File.join(File.dirname(__FILE__), '..', '..', 'address_app')
require 'rack/test'
require 'sinatra'
require 'cucumber'
require 'childprocess'
require 'timeout'

 include RSpec::Expectations

 Capybara.default_driver = :selenium
 Capybara.default_wait_time = 20
 Capybara.javascript_driver = :webkit

server = ChildProcess.build("rackup", "--port", "9000")
server.start
Timeout.timeout(3) do
  loop do
    begin
      HTTParty.get('local host here')
      break
    rescue Errno::ECONNREFUSED => try_again
      sleep 0.1
    end
  end
end

at_exit do
  server.stop
end
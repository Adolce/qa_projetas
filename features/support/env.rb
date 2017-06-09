 require 'capybara/cucumber'
 require 'gherkin'
 require 'rescue'
 require "json"
 require "selenium-webdriver"
 require "rspec"
 require "httparty"
 include RSpec::Expectations

 Capybara.default_driver = :selenium
 Capybara.default_wait_time = 20
 Capybara.javascript_driver = :webkit
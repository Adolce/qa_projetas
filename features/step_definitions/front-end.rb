 #encoding: utf-8
 # !/usr/bin/env ruby



before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://the-internet.herokuapp.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end


Given(/^que acesso a url de login$/) do
@driver.get(@base_url + "/login")
expect(page).to have_content‘Login Page’
end

When(/^preencho os campos obrigatorios de usuario e senha$/) do
    @driver.find_element(:id, "username").clear
    @driver.find_element(:id, "username").send_keys "tomsmith"
    @driver.find_element(:id, "password").clear
    @driver.find_element(:id, "password").send_keys "SuperSecretPassword!"
end

When(/^clico no botao login$/) do
   @driver.find_element(:id, "login").click
end

When(/^clico no botao logout$/) do
   @driver.find_element(:css, "i.icon-2x.icon-signout").click
end

When(/^preencho os campos obrigatorios de usuario e senha invalidos$/) do
    @driver.find_element(:id, "username").clear
    @driver.find_element(:id, "username").send_keys "th"
    @driver.find_element(:id, "password").clear
    @driver.find_element(:id, "password").send_keys "SupSecretPassword!"
end

Then (/^sou redirecionada para a pagina de area segura$/) do
   page.has_content?('Welcome to the Secure Area. When you are done click logout below.').should be_true
   find(".You logged into a secure area!").visible?
end	

Then (/^eu devo ser desconectada e redirecionada a pagina de logout$/) do
  page.has_content?('This is where you can log into the secure area. Enter tomsmith for the username and SuperSecretPassword! for the password. If the information is wrong you should see error messages.').should be_true
  find(".You logged out of the secure area!").visible?
end	

Then (/^nao sou redirecionada para proxima pagina e vejo a mensagem de erro$/) do
  find(".Your username is invalid!").visible?
end	

 after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
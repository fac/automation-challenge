require 'selenium-webdriver'
require 'cucumber'

# Ensure you're pointing to the correct driver for your OS and browser
# Default is set for Chrome Webdriver on MacOS (add '.exe' file extension for Windows)
driver_path = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'drivers', 'chromedriver'))

# Remember to change :Chrome: to :Firefox: if using Firefox Geckodriver
args = Selenium::WebDriver::Chrome::Options.new(
  args: ['start-maximized'],
  driver_path: driver_path,
)
# Remember to change :chrome to :firefox if using Firefox Geckodriver
browser = Selenium::WebDriver.for(:chrome, options: args)

Before do |_scenario|
  @browser = browser
end

at_exit do
  browser.quit
end

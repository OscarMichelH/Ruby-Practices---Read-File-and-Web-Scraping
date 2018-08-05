require 'csv'
require 'selenium'

driver = Selenium::WebDriver.for :chrome
url_to_navigate = "file:///C:/Tools/file.html"
driver.navigate.to url_to_navigate



def waitAndClickElement(xpath, driver, number)
    wait = Selenium::WebDriver::Wait.new(timeout: 20) # seconds
    wait.until { find_element(:xpath, xpath).displayed? }
    driver.find_element(:xpath, xpath).click
end


fileName = "summary.csv"
numbers = Array.new

CSV.open(fileName, 'r').each_with_index do |row, index|
    if index == 0
        next
    end
    numbers.push(row.first)
end


numbers.each do |number|
    wait = Selenium::WebDriver::Wait.new(timeout: 90) # seconds
    wait.until { find_element(:id, 'search').displayed? }
    
    element =  find_element(:id, 'search')
    element.send_keys number
    


end





driver.quit
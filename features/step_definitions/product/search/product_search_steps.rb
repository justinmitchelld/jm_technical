When(/^I search for a product and validate results$/) do |table|
  table.hashes.each do |hash|
    query = "#{hash[:product]}#{hash[:size].empty? ? '' : " (#{hash[:size]}ml)"}"

    @driver.find_element(id: 'searchQuery').click
    search_bar = @driver.find_element(:xpath, "//input[@type='text']")
    search_bar.clear
    search_bar.send_keys query
    search_bar.send_keys :enter

    if hash[:exists] == 'true'
      product = @driver.find_elements(class: 'item-name').first.text
      expect(product).to include(query)
    else
      search_result = @driver.find_elements(:xpath, "//span[contains(text(), 'No results found')]").first.text
      expect(search_result).to eq('No results found')
    end
  end
end
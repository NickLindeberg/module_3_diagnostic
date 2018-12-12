require 'rails_helper'

# As a user
feature "User can serach with zip code" do
  scenario "station information is displayed" do
    visit "/"

    fill_in "q", with: 80203
    click_on "Locate"

    expect(current_path).to eq(search_path)

    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_css('.station', count: 10)
    # And the stations should be limited to Electric and Propane
    expect(page).to_not have_content("E85")
    expect(page).to have_content("Electric")
    expect(page).to have_content("Propane")

    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end


# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

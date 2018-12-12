require 'rails_helper'

feature "User can search with zip code" do
  scenario "station information is displayed" do

    visit "/"

    fill_in "q", with: 80203

    click_on "Locate"

    expect(current_path).to eq(search_path)
    expect(page).to have_css('.station', count: 10)
    expect(page).to_not have_content("E85")
    expect(page).to have_content("Electric")
    expect(page).to have_content("Propane")

  end
end

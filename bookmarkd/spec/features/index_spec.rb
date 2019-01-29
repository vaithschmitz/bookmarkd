require "spec_helper"

feature "Index Page" do 
  scenario "Show Index Page On Launch" do 
    visit('/')
    expect(page).to have_content("Hi")
  end
end

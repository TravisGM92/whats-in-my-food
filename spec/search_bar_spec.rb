require 'rails_helper'

RSpec.describe 'movie show page' do
  describe 'As a user when I visit "/"' do
    describe "And I fill in the search form with 'sweet potatoes' and click 'Search'" do
      it "Then I should be on page '/foods', see a total number of items returned by the search" do
        visit "/"

        within('.form-group.search-field') do
          fill_in with: 'sweet potatoes'
        end
        click_button("Search")
        expect(current_path).to eq("/foods")
        expect(page).to have_content("Total results: 10")

      end
      it "Then I should see a list of ten foods that contain the ingredient 'sweet potatoes'" do
      end
      it "And for each of the foods I should see; the food's GTIN/UPC code, the food's description, the food's Brand Owner, the food's ingredients" do

      end
    end
  end
end

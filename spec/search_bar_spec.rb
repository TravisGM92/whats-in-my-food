require 'rails_helper'

RSpec.describe 'movie show page' do
  describe 'As a user when I visit "/"' do
    describe "And I fill in the search form with 'sweet potatoes' and click 'Search'" do
      it "Then I should be on page '/foods', see a total number of items returned by the search" do
        visit "/"

        json1 = File.read('spec/fixtures/foods.json')
        results = JSON.parse(File.read('spec/fixtures/foods.json'), symbolize_names: true)

        stub_request(:get, "https://api.nal.usda.gov/fdc/v1/foods/search?api_key=#{ENV['FDC_key']}&query=sweet%20potatoes").to_return(status: 200, body: json1)

        within('.form-group.search-field') do
          fill_in with: 'sweet potatoes'
        end
        click_button("Search")
        expect(current_path).to eq("/foods")

        expect(page).to have_content("Total results: #{results[:totalHits]}")

      end
      it "Then I should see a list of ten foods that contain the ingredient 'sweet potatoes'" do
      end
      it "And for each of the foods I should see; the food's GTIN/UPC code, the food's description, the food's Brand Owner, the food's ingredients" do

      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'the exhibit creation page' do
  describe 'when I visit "/exhibits/new"' do  
    describe 'user story 11' do
      it "can create a new exhibit" do
        visit "/exhibits/new"

        fill_in("Exhibit Name", with: "Ancient Anatolia")
        choose 'on_display_false'
        fill_in("Price", with: 18.38)
        
        click_button("Create Exhibit")

        expect(current_path).to eq("/exhibits")
        expect(page).to have_content("Ancient Anatolia")
      end
    end
  end
end
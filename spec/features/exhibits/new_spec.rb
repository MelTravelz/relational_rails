require 'rails_helper'

RSpec.describe 'the exhibit creation page' do
  describe 'user story 11' do
    describe 'when I visit "/exhibits/new"' do
      it "can create a new exhibit" do
        visit "/exhibits/new"

        fill_in("New Exhibit Name", with: "Ancient Anatolia")
        choose 'on_display_false'
        fill_in("Price", with: 18.38)
        
        click_button("Create Exhibit")

        # new_exhibit_id = Exhibit.last.id (if we wanted the route to go to a show page for a specific id)
        # you'd then string interpolate the route below:
        expect(current_path).to eq("/exhibits")
        expect(page).to have_content("Ancient Anatolia")
      end
    end
  end
end
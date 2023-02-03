require 'rails_helper'

RSpec.describe 'the exhibit creation page' do
  describe 'user story 11' do
    describe 'when I visit "/exhibits/new"' do
      it 'links to the creation page from the exhibits index page' do
        visit "/exhibits"
        click_link("New Exhibit")

        expect(current_path).to eq("/exhibits/new")
      end

      it "can create a new exhibit" do
        visit "/exhibits/new"

        fill_in("New Exhibit Name", with: "Ancient Anatolia")
        choose 'on_display_false'
        fill_in("Price", with: 18.38)
        
        click_button("Create Exhibit")

        new_exhibit_id = Artist.last.id
        expect(current_path).to eq("artists/#{new_exhibit_id}")
        expect(page).to have_content("Ancient Anatolia")
      end
    end
  end
end
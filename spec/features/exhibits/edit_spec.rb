require 'rails_helper'

RSpec.describe 'the exhibit update page' do
  describe 'user story 12' do
    describe 'when I visit "/exhibits/:id/' do
    it "can update an exhibit" do
      exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
      visit "/exhibits/#{exhibit_1.id}/edit"
      
      fill_in("Update Exhibit Name", with: "Ancient Celtics")
      choose 'on_display_true'
      fill_in("Update Price in USD", with: 18.00)
      
      click_button("Sumbit Update")

      expect(current_path).to eq("/exhibits/#{exhibit_1.id}")
      expect(page).to have_content("Ancient Celtics")
      end
    end
  end
end
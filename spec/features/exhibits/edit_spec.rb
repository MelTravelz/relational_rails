require 'rails_helper'

RSpec.describe 'the exhibit update page' do
  describe 'when I visit "/exhibits/:id/edit' do
    describe 'user story 12' do
      it "can update an exhibit" do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        visit "/exhibits/#{exhibit_1.id}/edit"
        
        fill_in("Exhibit Name", with: "Ancient Celtics")
        choose 'on_display_true'
        fill_in("Price in USD", with: 18.00)
        
        click_button("Update Exhibit")

        expect(current_path).to eq("/exhibits/#{exhibit_1.id}")
        expect(page).to have_content("Ancient Celtics")
        expect(page).to have_content("Currently on display: true")
        # expect(page).to have_content("Price: 18.00")
      end
    end
  end
end

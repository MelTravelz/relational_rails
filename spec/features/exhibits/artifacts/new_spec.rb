require 'rails_helper'

RSpec.describe 'the exhibit/artifacts index page' do
  describe 'user story 13' do
    describe 'when I visit "/exhibits/:id/artifacts/new"' do
      it "can create a new artifact" do
        exhibit_1 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)
        visit "/exhibits/#{exhibit_1.id}/artifacts/new"

        fill_in("New Artifact Name", with: "Wishing Stone")
        fill_in("Material", with: "Jasper")
        fill_in("Year Created (include BCE or CE)", with: "348 BCE")
        fill_in("Number of Total Pieces" , with: 1)
        choose 'on_loan_true'
        
        click_button("Create Artifact")

        expect(current_path).to eq("/exhibits/#{exhibit_1.id}/artifacts")
        expect(page).to have_content("Wishing Stone")
        expect(page).to have_content("Material: Jasper")
        expect(page).to have_content("Date Created: 348 BCE")
        expect(page).to have_content("Total Pieces: 1")
        expect(page).to have_content("On Loan from Another Museum? true")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'the artifacts update page' do
  describe 'user story 14' do
    describe 'when I visit "/artifacts/:id/edit' do
    it "can update an artifact" do
      exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
      artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

      visit "/artifacts/#{artifact_1.id}/edit"
      
      fill_in("Update Artifact Name", with: "Silla Golden Crown")
      fill_in("Update Material", with: "Gold")
      fill_in("Update Year Created (include BCE or CE)", with: "400 BCE")
      fill_in("Update Number of Total Pieces", with: 80)
      choose 'on_loan_true'
    
      click_button("Update Artifact")

      expect(current_path).to eq("/artifacts/#{artifact_1.id}")
      expect(page).to have_content("Silla Golden Crown")
      expect(page).to have_content("Material: Gold")
      expect(page).to have_content("Date Created: 400 BCE")
      expect(page).to have_content("Total Pieces: 80")
      expect(page).to have_content("On Loan from Another Museum? true")
      end
    end
  end
end
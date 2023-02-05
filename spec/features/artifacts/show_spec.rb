require 'rails_helper'

RSpec.describe 'the artifact show page' do
  describe 'user story 4' do
    describe 'when I visit "/artifacts/:id"' do
      it 'displays one artifact name and all its attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

        visit "/artifacts/#{artifact_1.id}"
        
        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content("Material: #{artifact_1.material}")
        expect(page).to have_content("Date Created: #{artifact_1.year_created}")
        expect(page).to have_content("Total Pieces: #{artifact_1.total_pieces}")
        expect(page).to have_content("On Loan from Another Museum? #{artifact_1.on_loan}")
      end
    end
  end

  describe 'user story 8' do
    describe 'when I visit "/artifacts/:id"'do 
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

        visit "/artifacts/#{artifact_1.id}"

        expect(page).to have_link("All Artifacts", href: "/artifacts")
      end
    end
  end

  describe 'user story 9' do
    describe 'when I visit "/artifacts/:id"'do 
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

        visit "/artifacts/#{artifact_1.id}"

        expect(page).to have_link("All Exhibits", href: "/exhibits")
      end
    end
  end

  describe 'user story 14' do
    describe 'when I visit "/artifacts/:id"' do
      it 'I see a link to update the artifact record' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 
        
        visit "/artifacts/#{artifact_1.id}"

        expect(page).to have_link("Update Artifact")
      end

      it 'when I click on the link it takes me to the artifacts edit page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 
        
        visit "/artifacts/#{artifact_1.id}"
        click_link("Update Artifact")

        expect(current_path).to eq("/artifacts/#{artifact_1.id}/edit")      
      end
    end
  end

end
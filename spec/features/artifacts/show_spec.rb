require 'rails_helper'

RSpec.describe 'the artifact show page' do
  describe 'when I visit "/artifacts/:id"' do
    let!(:exhibit_1) { Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00) }
    let!(:artifact_1) { Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) }
    let!(:artifact_2) { Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", total_pieces: 1, on_loan: true) }  
    let!(:artifact_3) { Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", total_pieces: 12, on_loan: true) }

    describe 'user story 4' do
      it 'displays one artifact name and all its attributes' do
        visit "/artifacts/#{artifact_1.id}"
        
        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content("Material: #{artifact_1.material}")
        expect(page).to have_content("Date Created: #{artifact_1.year_created}")
        expect(page).to have_content("Total Pieces: #{artifact_1.total_pieces}")
        expect(page).to have_content("On Loan from Another Museum: #{artifact_1.on_loan}")
        
        expect(page).to_not have_content(artifact_2.name)
        expect(page).to_not have_content(artifact_3.name)
      end
    end

    describe 'user story 8' do
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        visit "/artifacts/#{artifact_1.id}"
        expect(page).to have_link("All Artifacts", href: "/artifacts")

        click_link("All Artifacts")
        expect(current_path).to eq("/artifacts")   
      end
    end

    describe 'user story 9' do
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        visit "/artifacts/#{artifact_1.id}"
        expect(page).to have_link("All Exhibits", href: "/exhibits")

        click_link("All Exhibits")
        expect(current_path).to eq("/exhibits")  
      end
    end

    describe 'user story 14' do
      it 'I see a link to update the artifact record' do
        visit "/artifacts/#{artifact_1.id}"

        expect(page).to have_link("Update")
        # expect(page).to have_link("Update", href: "/artifacts/#{@artifact_1.id}/edit")
      end

      it 'when I click on the link it takes me to the artifacts edit page' do
        visit "/artifacts/#{artifact_1.id}"
        
        click_link("Update")
        # click_link("Update", href: "/artifacts/#{@artifact_1.id}/edit")

        expect(current_path).to eq("/artifacts/#{artifact_1.id}/edit")      
      end
    end

    describe 'user story 20' do
      it 'I see a link to delete the artifact record' do
        visit "/artifacts/#{artifact_1.id}"

        expect(page).to have_link("Delete")
        # expect(page).to have_link("Delete", href: "/artifacts/#{@artifact_1.id}")
      end

      it 'can delete an artifact & redirected to artifacts index page' do
        visit "/artifacts/#{artifact_1.id}"

        click_link("Delete")
        # click_link("Delete", href: "/artifacts/#{@artifact_1.id}")

        expect(current_path).to eq("/artifacts")   
        expect(page).to_not have_content(artifact_1.name)
        expect(page).to have_content(artifact_2.name)
        expect(page).to have_content(artifact_3.name)
      end
    end 
  end
end
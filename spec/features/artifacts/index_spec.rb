require 'rails_helper'

RSpec.describe 'the artifact index page' do
  describe 'when I visit "/artifacts"'do 
    let!(:exhibit_1) { Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00) }
    let!(:artifact_1) { Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) }
    let!(:artifact_2) { Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", total_pieces: 1, on_loan: true) }  
    let!(:artifact_3) { Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", total_pieces: 12, on_loan: true) }
    
    let!(:exhibit_2) { Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00) }
    let!(:artifact_4) { Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) }
    let!(:artifact_5) { Artifact.create!(exhibit: exhibit_2, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", total_pieces: 2, on_loan: true) }

    describe 'user story 3' do
      it 'displays all the artifacts and their attributes' do
        visit "/artifacts"

        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content("Material: #{artifact_1.material}")
        expect(page).to have_content("Date Created: #{artifact_1.year_created}")
        expect(page).to have_content("Total Pieces: #{artifact_1.total_pieces}")
        expect(page).to have_content("On Loan from Another Museum: #{artifact_1.on_loan}")

        expect(page).to have_content(artifact_2.name)
        expect(page).to have_content(artifact_3.name)
        expect(page).to have_content(artifact_4.name)
        expect(page).to have_content(artifact_5.name)
      end
    end

    describe 'user story 8' do
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        visit "/artifacts"

        expect(page).to have_link("All Artifacts", href: "/artifacts")
      end
    end

    describe 'user story 9' do
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        visit "/artifacts"

        expect(page).to have_link("All Exhibits", href: "/exhibits")
      end
    end

    describe 'user story 15' do
        it 'next to each record, I see a link to sort that artifact record' do
          visit "/artifacts" 

          expect(page).to have_link("Only View Artifact from Other Museums")
        end 

        it 'when I click on the link it displays only the artifacts with a true value for on_loan' do 
          visit "/artifacts" 

          expect(page).to have_content(artifact_1.name)
          expect(page).to have_content(artifact_2.name)
          expect(page).to have_content(artifact_3.name)
          expect(page).to have_content(artifact_4.name)
          expect(page).to have_content(artifact_5.name)

          click_link("Only View Artifact from Other Museums")

          expect(current_path).to eq("/artifacts")  
          expect(page).to_not have_content(artifact_1.name)

          expect(page).to have_content(artifact_2.name)
          expect(page).to have_content(artifact_3.name)
          expect(page).to have_content(artifact_4.name)
          expect(page).to have_content(artifact_5.name)
        end
    end

    describe 'user story 18' do
        it 'next to each record, I see a link to edit that artifact record' do
          visit "/artifacts"

          expect(page).to have_link("Update", href: "/artifacts/#{artifact_1.id}/edit")
          expect(page).to have_link("Update", href: "/artifacts/#{artifact_2.id}/edit")
          expect(page).to have_link("Update", href: "/artifacts/#{artifact_3.id}/edit")
          expect(page).to have_link("Update", href: "/artifacts/#{artifact_4.id}/edit")
          expect(page).to have_link("Update", href: "/artifacts/#{artifact_5.id}/edit")
        end

        it 'when I click on the link it takes me to the artifacts edit page' do 
          visit "/artifacts"

          click_link("Update", href: "/artifacts/#{artifact_3.id}/edit")

          expect(current_path).to eq("/artifacts/#{artifact_3.id}/edit")      
        end
    end
    
    describe 'user story 23' do
      it 'next to each record, I see a link to delete that artifact record' do
        visit "/artifacts"

        expect(page).to have_link("Delete", href: "/artifacts/#{artifact_1.id}")
        expect(page).to have_link("Delete", href: "/artifacts/#{artifact_2.id}")
        expect(page).to have_link("Delete", href: "/artifacts/#{artifact_3.id}")
        expect(page).to have_link("Delete", href: "/artifacts/#{artifact_4.id}")
        expect(page).to have_link("Delete", href: "/artifacts/#{artifact_5.id}")
      end

      it 'can delete an artifact & redirected to artifacts index page' do
        visit "/artifacts"

        click_link("Delete", href: "/artifacts/#{artifact_4.id}")

        expect(current_path).to eq("/artifacts")   
        expect(page).to_not have_content(artifact_4.name)

        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content(artifact_2.name)
        expect(page).to have_content(artifact_3.name)
        expect(page).to have_content(artifact_5.name)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'the artifact index page' do
  describe 'user story 3' do
    describe 'when I visit "/artifacts"'do 
      it 'displays all the artifacts and their attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "Marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

        visit "/artifacts"
        
        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content("Material: #{artifact_1.material}")
        expect(page).to have_content("Date Created: #{artifact_1.year_created}")
        expect(page).to have_content("Total Pieces: #{artifact_1.total_pieces}")
        expect(page).to have_content("On Loan from Another Museum: #{artifact_1.on_loan}")
      end
    end
  end

  describe 'user story 8' do
    describe 'when I visit "/artifacts"'do 
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        visit "/artifacts"
        expect(page).to have_link("All Artifacts", href: "/artifacts")
      end
    end
  end

  describe 'user story 9' do
    describe 'when I visit "/artifacts"'do 
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        visit "/artifacts"
        expect(page).to have_link("All Exhibits", href: "/exhibits")
      end
    end
  end

  describe 'user story 17' do
    describe 'when I visit "/artifacts"' do
      it 'next to each record, I see a link to edit that artifact record' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 
        
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)
        artifact_2 = Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) 
        artifact_3 = Artifact.create!(exhibit: exhibit_2, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", total_pieces: 2, on_loan: true) 

        visit "/artifacts"

        expect(page).to have_link("Update Artifact: #{artifact_1.name}")
        expect(page).to have_link("Update Artifact: #{artifact_2.name}")
        expect(page).to have_link("Update Artifact: #{artifact_3.name}")
      end

      it 'when I click on the link it takes me to the artifacts edit page' do 
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 
        
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)
        artifact_2 = Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) 
        artifact_3 = Artifact.create!(exhibit: exhibit_2, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", total_pieces: 2, on_loan: true) 

        visit "/artifacts"
        click_link("Update Artifact: #{artifact_2.name}")

        expect(current_path).to eq("/artifacts/#{artifact_2.id}/edit")      
      end
    end
  end
  
  describe 'user story 23' do
    describe 'when I visit "/artifacts"' do
      it 'next to each record, I see a link to delete that artifact record' do
        exhibit_1 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", total_pieces: 2, on_loan: true) 

        visit "/artifacts"

        expect(page).to have_link("Delete Artifact: #{artifact_1.name}")
        expect(page).to have_link("Delete Artifact: #{artifact_2.name}")
      end

      it 'can delete an artifact & redirected to artifacts index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", total_pieces: 2, on_loan: true) 

        visit "/artifacts"
        click_link("Delete Artifact: #{artifact_1.name}")

        expect(current_path).to eq("/artifacts")   

        expect(page).to_not have_content(artifact_1.name)
        expect(page).to_not have_content("Material: #{artifact_1.material}")
        expect(page).to_not have_content("Date Created: #{artifact_1.year_created}")
        expect(page).to_not have_content("Total Pieces: #{artifact_1.total_pieces}")
         # Not sure what to do with this test: for now it passes but since its a boolean, most likely
        # another artifact would have this same output
        # expect(page).to_not have_content("On Loan from Another Museum: #{artifact_1.on_loan}")

        expect(page).to have_content(artifact_2.name)
        expect(page).to have_content("Material: #{artifact_2.material}")
        expect(page).to have_content("Date Created: #{artifact_2.year_created}")
        expect(page).to have_content("Total Pieces: #{artifact_2.total_pieces}")
        expect(page).to have_content("On Loan from Another Museum: #{artifact_2.on_loan}")
      end
    end
  end

end

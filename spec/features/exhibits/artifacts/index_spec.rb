require 'rails_helper'

RSpec.describe 'the exhibit/artifacts index page' do
    describe 'when I visit "/exhibits/:id/artifacts"' do
      let!(:exhibit_2) { Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00) }
      let!(:artifact_4) { Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) }
      let!(:artifact_5) { Artifact.create!(exhibit: exhibit_2, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", total_pieces: 2, on_loan: true) }
  
    describe 'user story 5' do
      it 'displays one exhibit name and all its artifacts and artifacts attributes' do      
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        expect(page).to have_content("Artifacts in #{exhibit_2.name} Exhibit")

        expect(page).to have_content(artifact_4.name)
        expect(page).to have_content("Material: #{artifact_4.material}")
        expect(page).to have_content("Date Created: #{artifact_4.year_created}")
        expect(page).to have_content("Total Pieces: #{artifact_4.total_pieces}")
        expect(page).to have_content("On Loan from Another Museum: #{artifact_4.on_loan}")

        expect(page).to have_content(artifact_5.name)
      end
    end

    describe 'user story 8' do
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"
        
        expect(page).to have_link("All Artifacts", href: "/artifacts")
      end
    end

    describe 'user story 9' do
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        expect(page).to have_link("All Exhibits", href: "/exhibits")
      end
    end

    describe 'user story 13' do
      it 'I see a link to create a new artifact record' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        expect(page).to have_link("New Artifact")
      end

      it 'when I click on the link it takes me to the artifact new page' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"
        click_link("New Artifact")

        expect(current_path).to eq("/exhibits/#{exhibit_2.id}/artifacts/new")      
      end
    end

    describe 'user story 16' do
      it 'I see a link to sort artifact records alphabetically' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        expect(page).to have_link("Sort Alphabetically")
      end

      it 'when I click on the link it displays the artifacts in alphabetical order' do 
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        expect(artifact_4.name).to appear_before(artifact_5.name)

        click_link("Sort Alphabetically")

        expect(current_path).to eq("/exhibits/#{exhibit_2.id}/artifacts")      
        expect(artifact_5.name).to appear_before(artifact_4.name)
      end
    end

    describe 'user story 18' do
      it 'next to each record, I see a link to edit that artifact record' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        expect(page).to have_link("Update", href: "/artifacts/#{artifact_4.id}/edit")
        expect(page).to have_link("Update", href: "/artifacts/#{artifact_5.id}/edit")
      end

      it 'when I click on the link it takes me to the artifacts edit page' do 
        visit "/exhibits/#{exhibit_2.id}/artifacts"
        click_link("Update", href: "/artifacts/#{artifact_5.id}/edit")

        expect(current_path).to eq("/artifacts/#{artifact_5.id}/edit")      
      end
    end

    describe 'user story 21' do
      it 'can accept threshold number value & return only the artifact records that meet that threshold number' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        fill_in("Total Pieces", with: 1)
        click_on("Filter")

        expect(current_path).to eq("/exhibits/#{exhibit_2.id}/artifacts")
        expect(page).to have_content(artifact_5.name)
        expect(page).to_not have_content(artifact_4.name)
      end
    end

    describe 'user story 23' do
      it 'next to each record, I see a link to delete that artifact record' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"

        expect(page).to have_link("Delete", href: "/artifacts/#{artifact_4.id}")
        expect(page).to have_link("Delete", href: "/artifacts/#{artifact_5.id}")
      end

      it 'can delete an artifact & redirected to artifacts index page' do
        visit "/exhibits/#{exhibit_2.id}/artifacts"
        click_link("Delete", href: "/artifacts/#{artifact_4.id}")

        expect(current_path).to eq("/artifacts")   

        expect(page).to_not have_content(artifact_4.name)
        expect(page).to have_content(artifact_5.name)
      end
    end
  end
end
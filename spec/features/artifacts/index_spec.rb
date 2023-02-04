require 'rails_helper'

RSpec.describe 'the artifact index page' do
  describe 'user story 3' do
    describe 'when I visit "/artifacts"'do 
      it 'displays all the artifacts and their attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 
        artifact_2 = Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1,  on_loan: true) 

        visit "/artifacts"
        
        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content("Material: #{artifact_1.material}")
        expect(page).to have_content("Date Created: #{artifact_1.year_created}")
        expect(page).to have_content("Total pieces: #{artifact_1.total_pieces}")
        expect(page).to have_content("On loan from another museum? #{artifact_1.on_loan}")

        expect(page).to have_content(artifact_2.name)
        expect(page).to have_content("Material: #{artifact_2.material}")
        expect(page).to have_content("Date Created: #{artifact_2.year_created}")
        expect(page).to have_content("Total pieces: #{artifact_2.total_pieces}")
        expect(page).to have_content("On loan from another museum? #{artifact_2.on_loan}")
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
  
end

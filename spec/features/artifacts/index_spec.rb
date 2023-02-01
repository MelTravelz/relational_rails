require 'rails_helper'

RSpec.describe 'the artifact index page' do
  let!(:exhibit_1) { Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00) }
  let!(:exhibit_2) { Exhibit.create!(name: "Ancient Korea", start_date: "2023-04-14", end_date: "2023-06-20", on_display: false, price: 17.00) }

  let!(:artifact_1) { Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) }
  let!(:artifact_2) { Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12) }
  
  let!(:artifact_4) { Artifact.create!(exhibit: exhibit_2, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", on_loan: true, total_pieces: 2) }
  let!(:artifact_5) { Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", on_loan: true, total_pieces: 1) }

  describe 'user story 3' do
    describe 'when I visit "/artifacts"'do 
      it 'displays all the artifacts and their attributes' do
        visit '/artifacts'
        
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

        expect(page).to have_content(artifact_4.name)
        expect(page).to have_content("Material: #{artifact_4.material}")
        expect(page).to have_content("Date Created: #{artifact_4.year_created}")
        expect(page).to have_content("Total pieces: #{artifact_4.total_pieces}")
        expect(page).to have_content("On loan from another museum? #{artifact_4.on_loan}")

        expect(page).to have_content(artifact_5.name)
        expect(page).to have_content("Material: #{artifact_5.material}")
        expect(page).to have_content("Date Created: #{artifact_5.year_created}")
        expect(page).to have_content("Total pieces: #{artifact_5.total_pieces}")
        expect(page).to have_content("On loan from another museum? #{artifact_5.on_loan}")
      end
    end
  end
end

require 'rails_helper'
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'the exhibit/artifacts index page' do
  describe 'user story 5' do
    describe 'when I visit "/exhibits/:id/artifacts"' do
      it 'displays one exhibit name and all its artifacts and artifacts attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Korea", start_date: "2023-04-14", end_date: "2023-06-20", on_display: false, price: 17.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", total_pieces: 2, on_loan: true) 
      
        visit "/exhibits/#{exhibit_1.id}/artifacts"

        expect(page).to have_content("Artifacts in #{exhibit_1.name} Exhibit")

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

      # it 'links to each songs show page'
    end
  end
end
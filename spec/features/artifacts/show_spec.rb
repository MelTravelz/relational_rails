require 'rails_helper'

RSpec.describe 'the artifact show page' do
  describe 'as a visitor' do
    describe 'when i visit "/artifacts/:id"' do
      it 'shows that one artifact and all its attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", start_date: "2023-04-14", end_date: "2023-06-20", on_display: false, price: 17.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5)
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12)
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1)
        
        artifact_4 = Artifact.create!(exhibit: exhibit_2, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", on_loan: true, total_pieces: 2)
        artifact_5 = Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", on_loan: true, total_pieces: 1)
        artifact_6 = Artifact.create!(exhibit: exhibit_2, name: "Silla Golden Crown", material: "gold", year_created: "400 BCE", on_loan: true, total_pieces: 1)
        artifact_7 = Artifact.create!(exhibit: exhibit_2, name: "Pensive Bodhisattva", material: "gilt bronze", year_created: "610 BCE", on_loan: true, total_pieces: 1)
        
        # Capybara
        visit "/artifacts/#{artifact_1.id}"
        # go to localhost:3000/artifacts/1
        
        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content(artifact_1.material)
        expect(page).to have_content(artifact_1.year_created)
        expect(page).to have_content(artifact_1.on_loan)
        expect(page).to have_content(artifact_1.total_pieces)

        expect(page).to_not have_content(artifact_2.name)
        expect(page).to_not have_content(artifact_2.material)
        expect(page).to_not have_content(artifact_2.year_created)
        expect(page).to_not have_content(artifact_2.on_loan)
        expect(page).to_not have_content(artifact_2.total_pieces)
      end
    end
  end
end
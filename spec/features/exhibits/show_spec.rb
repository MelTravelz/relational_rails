require 'rails_helper'

RSpec.describe 'the exhibit show page' do
  let!(:exhibit_1) { Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00) }
  let!(:exhibit_2) { Exhibit.create!(name: "Ancient Korea", start_date: "2023-04-14", end_date: "2023-06-20", on_display: false, price: 17.00) }

  let!(:artifact_1) { Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) }
  let!(:artifact_2) { Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12) }
  let!(:artifact_3) { Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1) }
  
  let!(:artifact_4) { Artifact.create!(exhibit: exhibit_2, name: "Divine Bell of King Seongdeok", material: "metal", year_created: "771 BCE", on_loan: true, total_pieces: 2) }
  let!(:artifact_5) { Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", on_loan: true, total_pieces: 1) }
  let!(:artifact_6) { Artifact.create!(exhibit: exhibit_2, name: "Silla Golden Crown", material: "gold", year_created: "400 BCE", on_loan: true, total_pieces: 1) }
  let!(:artifact_7) { Artifact.create!(exhibit: exhibit_2, name: "Pensive Bodhisattva", material: "gilt bronze", year_created: "610 BCE", on_loan: true, total_pieces: 1) }
  

  describe 'as a visitor' do
    describe 'when i visit "/exhibits/:id"' do
      it 'shows that one exhibit name and its attributes' do
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_content(exhibit_1.name) 
        expect(page).to have_content(exhibit_1.start_date)
        expect(page).to have_content(exhibit_1.end_date)
        expect(page).to have_content(exhibit_1.on_display)
        expect(page).to have_content(exhibit_1.price)

        expect(page).to_not have_content(exhibit_2.name)
        expect(page).to_not have_content(exhibit_2.start_date)
        expect(page).to_not have_content(exhibit_2.end_date)
        expect(page).to_not have_content(exhibit_2.on_display)
        expect(page).to_not have_content(exhibit_2.price)
      end
    end
  end
end
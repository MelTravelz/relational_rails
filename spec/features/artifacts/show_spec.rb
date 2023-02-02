require 'rails_helper'

RSpec.describe 'the artifact show page' do
  describe 'user story 4' do
    describe 'when I visit "/artifacts/:id"' do
      it 'displays one artifact name and all its attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

        visit "/artifacts/#{artifact_1.id}"
        
        expect(page).to have_content(artifact_1.name)
        expect(page).to have_content("Material: #{artifact_1.material}")
        expect(page).to have_content("Date Created: #{artifact_1.year_created}")
        expect(page).to have_content("Total pieces: #{artifact_1.total_pieces}")
        expect(page).to have_content("On loan from another museum? #{artifact_1.on_loan}")
      end
    end
  end

  describe 'user story 8' do
    describe 'when I visit "/artifacts/:id"'do 
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

        visit "/artifacts/#{artifact_1.id}"

        expect(page).to have_link("All Artifacts", href: "http://localhost:3000/artifacts")
      end
    end
  end

  describe 'user story 9' do
    describe 'when I visit "/artifacts/:id"'do 
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 

        visit "/artifacts/#{artifact_1.id}"

        expect(page).to have_link("All Exhibits", href: "http://localhost:3000/exhibits")
      end
    end
  end

end
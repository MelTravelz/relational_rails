require 'rails_helper'

RSpec.describe 'the exhibit show page' do
  describe 'user story 2' do
    describe 'when I visit "/exhibits/:id"' do
      it 'displays one exhibit name and its attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)

        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_content(exhibit_1.name) 
        expect(page).to have_content("Start Date: #{exhibit_1.start_date}")
        expect(page).to have_content("End Date: #{exhibit_1.end_date}")
        expect(page).to have_content("Currently on display? #{exhibit_1.on_display}")
        expect(page).to have_content("Price: #{exhibit_1.price}")
      end
    end
  end

  describe 'user story 7' do
    describe 'when I visit "/exhibits/:id"' do
      it 'displays the count of the number of artifacts associated with this exhibit' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12) 
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1) 
        
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_content("Number of Artifacts: #{exhibit_1.count_of_artifacts}")
      end
    end
  end

  describe 'user story 8' do
    describe 'when I visit "/exhibits/:id"' do
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12) 
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1) 
        
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("All Artifacts", href: "http://localhost:3000/artifacts")
      end
    end
  end

  describe 'user story 9' do
    describe 'when I visit "/exhibits/:id"' do
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12) 
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1) 
        
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("All Exhibits", href: "http://localhost:3000/exhibits")
      end
    end
  end
end
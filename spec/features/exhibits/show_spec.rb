require 'rails_helper'

RSpec.describe 'the exhibit show page' do
  describe 'user story 2' do
    describe 'when I visit "/exhibits/:id"' do
      it 'displays one exhibit name and its attributes' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)

        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_content(exhibit_1.name) 
        expect(page).to have_content("Currently on display? #{exhibit_1.on_display}")
        expect(page).to have_content("Price: #{exhibit_1.price}")
      end
    end
  end

  describe 'user story 7' do
    describe 'when I visit "/exhibits/:id"' do
      it 'displays the count of the number of artifacts associated with this exhibit' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)

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
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", total_pieces: 12, on_loan: true) 
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", total_pieces: 1, on_loan: true) 
        
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("All Artifacts", href: "/artifacts")
      end
    end
  end

  describe 'user story 9' do
    describe 'when I visit "/exhibits/:id"' do
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12) 
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1) 
        
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("All Exhibits", href: "/exhibits")
      end
    end
  end

  describe 'user story 10' do
    describe 'when I visit "/exhibits/:id"' do
      it 'I see a link to the exhibits artifacts page (/exhibits/:id/artifacts)' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)

        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("View All Artifacts for this Exhibit", href: "/exhibits/#{exhibit_1.id}/artifacts")
      end
    end
  end

  describe 'user story 12' do
    describe 'when I visit "/exhibits/:id"' do
      it 'I see a link to update the exhibit record' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        
        visit "/exhibits/#{exhibit_1.id}"
        
        expect(page).to have_link("Update Exhibit")
      end

      it 'when I click on the link it takes me to the exhibits edit page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        
        visit "/exhibits/#{exhibit_1.id}"
        click_link("Update Exhibit")

        expect(current_path).to eq("/exhibits/#{exhibit_1.id}/edit")      
      end
    end
  end

  describe 'user story 19' do
    describe 'when I visit "/exhibits/:id"' do
      it 'I see a link to delete the exhibit record' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("Delete Exhibit")
      end

      it 'when I click on the link it deletes the exhibit and all associated artifacts & redirected to exhibits index page' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00, created_at: Time.now - 2.hour)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00, created_at: Time.now - 1.hour)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 
        artifact_2 = Artifact.create!(exhibit: exhibit_2, name: "Roof-end Tile with Face Design", material: "tile", year_created: "800 BCE", total_pieces: 1, on_loan: true) 

        visit "/exhibits/#{exhibit_1.id}"
        click_link("Delete Exhibit")

        expect(current_path).to eq("/exhibits")      
        expect(page).to_not have_content(exhibit_1.name)
        expect(page).to_not have_content("Created at: #{exhibit_1.created_at}")
        expect(page).to have_content(exhibit_2.name)
        expect(page).to have_content("Created at: #{exhibit_2.created_at}")

        visit "/artifacts"

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
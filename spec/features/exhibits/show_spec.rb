require 'rails_helper'

RSpec.describe 'the exhibit show page' do
  describe 'when I visit "/exhibits/:id"' do
    let!(:exhibit_1) { Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00) }
    let!(:exhibit_2) { Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00) }

    let!(:artifact_1) { Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) }
    let!(:artifact_2) { Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", total_pieces: 1, on_loan: true) }  
    let!(:artifact_3) { Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", total_pieces: 12, on_loan: true) }

    describe 'user story 2' do
      it 'displays one exhibit name and its attributes' do
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_content(exhibit_1.name) 
        expect(page).to have_content("Currently on display: #{exhibit_1.on_display}")
        expect(page).to have_content("Price: #{exhibit_1.price}")
      end
    end

    describe 'user story 7' do
      it 'displays the count of the number of artifacts associated with this exhibit' do
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_content("Number of Artifacts: #{exhibit_1.count_of_artifacts}")
      end
    end

    describe 'user story 8' do
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        visit "/exhibits/#{exhibit_1.id}"
        expect(page).to have_link("All Artifacts", href: "/artifacts")

        click_link("All Artifacts")
        expect(current_path).to eq("/artifacts")   
      end
    end

    describe 'user story 9' do
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        visit "/exhibits/#{exhibit_1.id}"
        expect(page).to have_link("All Exhibits", href: "/exhibits")

        click_link("All Exhibits")
        expect(current_path).to eq("/exhibits")  
      end
    end

    describe 'user story 10' do
      it 'I see a link to the exhibits artifacts page (/exhibits/:id/artifacts)' do
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("View All Artifacts", href: "/exhibits/#{exhibit_1.id}/artifacts")
      end
    end

    describe 'user story 12' do
      it 'I see a link to update the exhibit record' do
        visit "/exhibits/#{exhibit_1.id}"
        
        expect(page).to have_link("Update")
        # expect(page).to have_link("Update", href: "/exhibits/#{@exhibit_1.id}/edit")
      end

      it 'when I click on the link it takes me to the exhibits edit page' do
        visit "/exhibits/#{exhibit_1.id}"

        click_link("Update")
        # click_link("Update", href: "/exhibits/#{@exhibit_1.id}/edit")

        expect(current_path).to eq("/exhibits/#{exhibit_1.id}/edit")      
      end
    end

    describe 'user story 19' do
      it 'I see a link to delete the exhibit record' do
        visit "/exhibits/#{exhibit_1.id}"

        expect(page).to have_link("Delete")
      # expect(page).to have_link("Delete", href: "/exhibits/#{@exhibit_1.id}")
      end

      it 'when I click on the link it deletes the exhibit and all associated artifacts & redirected to exhibits index page' do
        visit "/exhibits/#{exhibit_1.id}"
        
        click_link("Delete")
        # click_link("Delete", href: "/exhibits/#{@exhibit_1.id}")

        expect(current_path).to eq("/exhibits")      
        expect(page).to_not have_content(exhibit_1.name)
        expect(page).to have_content(exhibit_2.name)
      end
    end
  end
end
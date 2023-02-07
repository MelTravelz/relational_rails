require 'rails_helper'

RSpec.describe 'the exhibit index page' do
  describe 'when I visit "/exhibits"'do 
    let!(:exhibit_1) { Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00, created_at: Time.now - 2.hour) }
    let!(:exhibit_2) { Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00, created_at: Time.now - 1.hour) }

    describe 'user story 1' do
      it 'displays all the exhibit names' do
        visit "/exhibits"

        expect(page).to have_content(exhibit_1.name)
        expect(page).to have_content(exhibit_2.name)
      end
    end

    describe 'EXTRA: exhibit name is also a link to its show page' do
      it 'the name of each record is a link to its show page' do
        visit "/exhibits" 
        expect(page).to have_link("#{exhibit_1.name}", href: "/exhibits/#{exhibit_1.id}")

        click_link("#{exhibit_1.name}")
        expect(current_path).to eq("/exhibits/#{exhibit_1.id}")   
      end 
    end

    describe 'user story 6' do
      it 'displays exhibits ordered by most recently created first' do
        visit "/exhibits"

        expect(exhibit_2.name).to appear_before(exhibit_1.name)
      end

      it 'displays when it was created_at next to each of the records' do
        visit "/exhibits"

        expect(page).to have_content("Created at: #{exhibit_1.created_at}")
        expect(page).to have_content("Created at: #{exhibit_2.created_at}")
      end
    end

    describe 'user story 8' do
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        visit "/exhibits"
        expect(page).to have_link("All Artifacts", href: "/artifacts")

        click_link("All Artifacts")
        expect(current_path).to eq("/artifacts")   
      end
    end

    describe 'user story 9' do
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        visit "/exhibits"
        expect(page).to have_link("All Exhibits", href: "/exhibits")

        click_link("All Exhibits")
        expect(current_path).to eq("/exhibits")  
      end
    end


    describe 'user story 11' do
      it 'I see a link to create a new exhibit record' do
        visit "/exhibits"
        expect(page).to have_link("New Exhibit")
      end

      it 'when I click on the link it takes me to the exhibits new page' do
        visit "/exhibits"
        click_link("New Exhibit")
        expect(current_path).to eq("/exhibits/new")      
      end
    end

    describe 'user story 17' do
      it 'next to each record, I see a link to edit that exhibit record' do
        visit "/exhibits"

        expect(page).to have_link("Update", href: "/exhibits/#{exhibit_1.id}/edit")
        expect(page).to have_link("Update", href: "/exhibits/#{exhibit_2.id}/edit")
      end

      it 'when I click on the link it takes me to the exhibits edit page' do 
        visit "/exhibits"
        click_link("Update", href: "/exhibits/#{exhibit_1.id}/edit")

        expect(current_path).to eq("/exhibits/#{exhibit_1.id}/edit")      
      end
    end

    describe 'user story 22' do
      it 'next to each record, I see a link to delete that exhibit record' do
        visit "/exhibits"

        expect(page).to have_link("Delete", href: "/exhibits/#{exhibit_1.id}")
        expect(page).to have_link("Delete", href: "/exhibits/#{exhibit_2.id}")
      end

      it 'can delete an exhibit(and all associated artifacts) & redirected to exhibit index page' do
        visit "/exhibits"
        click_link("Delete", href: "/exhibits/#{exhibit_1.id}")

        expect(current_path).to eq("/exhibits")  

        expect(page).to_not have_content(exhibit_1.name)
        expect(page).to_not have_content("Created at: #{exhibit_1.created_at}")

        expect(page).to have_content(exhibit_2.name)
        expect(page).to have_content("Created at: #{exhibit_2.created_at}")
      end
    end
  end
end
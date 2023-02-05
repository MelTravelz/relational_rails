require 'rails_helper'

RSpec.describe 'the exhibit index page' do
  describe 'user story 1' do
    describe 'when I visit "/exhibits"'do 
      it 'displays all the exhibit names' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)

        visit "/exhibits"

        expect(page).to have_content(exhibit_1.name)
        expect(page).to have_content(exhibit_2.name)
      end
    end
  end

  describe 'user story 6' do
    describe 'when I visit "/exhibits"'do 
      it 'displays exhibits ordered by most recently created first' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00, created_at: Time.now - 2.hour)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00, created_at: Time.now - 1.hour)

        visit "/exhibits"

        expect(exhibit_2.name).to appear_before(exhibit_1.name)
      end

      it 'displays when it was created_at next to each of the records' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00, created_at: Time.now - 2.hour)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00, created_at: Time.now - 1.hour)

        visit "/exhibits"

        expect(page).to have_content("Created at: #{exhibit_1.created_at}")
        expect(page).to have_content("Created at: #{exhibit_2.created_at}")
      end
    end
  end

  describe 'user story 8' do
    describe 'when I visit "/exhibits"'do 
      it 'I see a link at the top of the page that takes me to the Artifacts Index page' do
        visit "/exhibits"
        expect(page).to have_link("All Artifacts", href: "/artifacts")
      end
    end
  end

  describe 'user story 9' do
    describe 'when I visit "/exhibits"'do 
      it 'I see a link at the top of the page that takes me to the Exhibits Index page' do
        visit "/exhibits"
        expect(page).to have_link("All Exhibits", href: "/exhibits")
      end
    end
  end

  describe 'user story 11' do
    describe 'when I visit "/exhibits"' do
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
  end

  describe 'user story 17' do
    describe 'when I visit "/exhibits"' do
      it 'next to each record, I see a link to edit that exhibit record' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)
        
        visit "/exhibits"

        expect(page).to have_link("Update Exhibit: #{exhibit_1.name}")
        expect(page).to have_link("Update Exhibit: #{exhibit_2.name}")
      end

      it 'when I click on the link it takes me to the exhibits edit page' do 
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00)

        visit "/exhibits"
        click_link("Update Exhibit: #{exhibit_1.name}")

        expect(current_path).to eq("/exhibits/#{exhibit_1.id}/edit")      
      end
    end
  end

  describe 'user story 22' do
    describe 'when I visit "/exhibits"' do
      it 'next to each record, I see a link to delete that exhibit record' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00, created_at: Time.now - 2.hour)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00, created_at: Time.now - 1.hour)

        visit "/exhibits"

        expect(page).to have_link("Delete Exhibit: #{exhibit_1.name}")
        expect(page).to have_link("Delete Exhibit: #{exhibit_2.name}")
      end

      xit 'can delete an artifact & redirected to exhibit index page' do

      end
    end
  end
end
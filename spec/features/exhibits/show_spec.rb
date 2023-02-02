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
end
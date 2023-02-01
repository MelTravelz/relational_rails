require 'rails_helper'

RSpec.describe 'the exhibit index page' do
  describe 'user story 1' do
    describe 'when I visit "/exhibits"'do 
      it 'displays all the exhibit names' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", start_date: "2022-11-15", end_date: "2023-02-14", on_display: true, price: 15.00)
        exhibit_2 = Exhibit.create!(name: "Ancient Korea", start_date: "2023-04-14", end_date: "2023-06-20", on_display: false, price: 17.00)

        visit '/exhibits'

        expect(page).to have_content(exhibit_1.name)
        expect(page).to have_content(exhibit_2.name)
      end
    end
  end
end
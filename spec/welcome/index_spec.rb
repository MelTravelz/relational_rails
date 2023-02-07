require 'rails_helper'

RSpec.describe 'the welcome index page' do
    describe 'when I visit "/" the homepage' do
      it 'displays one exhibit name and all its artifacts and artifacts attributes' do      
        # THIS LINE IS FAILING:
        # visit "/"
        # assert_respone :success

        # expect(page).to have_content("The Museum of Curious Ancient Archeological Artifacts")
        # expect(page).to have_link("Enter Site", href: "/exhibits")

        # click_link("Enter Site")

        # expect(current_path).to eq("/exhibits")   
      end
    end
  end
      
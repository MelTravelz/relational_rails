require 'rails_helper'

RSpec.describe Artifact, type: :model do
  it {should belong_to :exhibit}

  describe 'user story 15' do
    describe '#only_disply_if_true"'do 
      it 'only displays artifact records where "on_loan" is true' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)
        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "Marble", year_created: "45 BCE", total_pieces: 5, on_loan: false) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", total_pieces: 12, on_loan: true) 
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", total_pieces: 1, on_loan: true) 

        expect(Artifact.only_display_if_true).to eq([artifact_2, artifact_3])
      end
    end
  end

end
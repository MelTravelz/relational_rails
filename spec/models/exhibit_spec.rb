require 'rails_helper'

RSpec.describe Exhibit, type: :model do
  # before do
  #   Artifact.destroy_all
  #   Exhibit.destroy_all
  # end 

  it {should have_many :artifacts}

  describe 'instance methods' do
    describe 'user story 6' do
      describe '#order_by_most_recently_created' do
        it 'displays the exhibits in order of most recetly created first' do
          exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00, created_at: Time.now - 2.hour)
          exhibit_2 = Exhibit.create!(name: "Ancient Korea", on_display: false, price: 17.00, created_at: Time.now - 1.hour)

          # This expect is calling on all the Exhibit records... a class method: 
          expect(Exhibit.order_by_most_recently_created.to_a).to eq([exhibit_2, exhibit_1])
        end
      end
    end
  end

  describe 'user story 7' do
    describe '#count_of_artifacts' do
      it 'returns the count of artifacts in an exhibit' do
        exhibit_1 = Exhibit.create!(name: "Ancient Rome", on_display: true, price: 15.00)

        artifact_1 = Artifact.create!(exhibit: exhibit_1, name: "Statue of Augustus", material: "marble", year_created: "45 BCE", on_loan: false, total_pieces: 5) 
        artifact_2 = Artifact.create!(exhibit: exhibit_1, name: "Nummus Aureus Coin", material: "gold", year_created: "312 CE", on_loan: true, total_pieces: 12) 
        artifact_3 = Artifact.create!(exhibit: exhibit_1, name: "Galdiator Cup", material: "glass", year_created: "75 BCE", on_loan: true, total_pieces: 1) 

        expect(exhibit_1.count_of_artifacts).to eq(3)
      end
    end
  end
end

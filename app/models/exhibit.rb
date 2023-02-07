class Exhibit < ApplicationRecord
  has_many :artifacts, dependent: :destroy
 
  # validates :name, presence: true 
  # validates on_loan, inclusion; [true, false]
  #this makes it so that when a new record is created
  # that field must be filled

  #test to validate expect(name).to be_valid
  # added example artifacts with nil values -> .to_not be_valid

  def count_of_artifacts
    artifacts.count
  end

  def self.order_by_most_recently_created
    order(created_at: :desc)
  end
end

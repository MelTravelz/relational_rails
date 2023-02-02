class Exhibit < ApplicationRecord
  has_many :artifacts, dependent: :destroy

  def count_of_artifacts
    self.artifacts.count
  end
end

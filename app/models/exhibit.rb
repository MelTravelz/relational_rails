class Exhibit < ApplicationRecord
  has_many :artifacts, dependent: :destroy

  def count_of_artifacts
    artifacts.count
  end

  def self.order_by_most_recently_created
    order(created_at: :desc)
  end
end

class Artifact < ApplicationRecord
  belongs_to :exhibit
  # this is the same as the method below:
  # scope :only_display_if_true, ->  { where(on_loan: :true) }

  def self.only_display_if_true
    where(on_loan: true)
  end

  def self.sort_alphabetically
    order(:name)
  end

  def self.filter_by_total_pieces(num)
    where("total_pieces > #{num}")
  end
end
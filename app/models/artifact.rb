class Artifact < ApplicationRecord
  belongs_to :exhibit
  # scope :only_display_if_true, ->  { where(on_loan: :true) }

  def self.only_display_if_true
      where(on_loan: :true)
  end

  # def self.sort_alphabetically
  #   order(on_loan: :true)
  # end

  # scope does need a model test 
  # and becomes a "feature" ??
  # If you're sorting/filter you can use scope
  # scope :only_disply_if_true, -> (where("on_loan"))
end
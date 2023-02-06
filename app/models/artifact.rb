class Artifact < ApplicationRecord
  belongs_to :exhibit

  def self.only_display_if_true
    where("on_loan")
  end

  # scope doesn't need a model test because it's called in the controller
  # and becomes a "feature" ??
  # If you're sorting/filter you can use scope
  # scope :only_disply_if_true, -> (where("on_loan"))
end
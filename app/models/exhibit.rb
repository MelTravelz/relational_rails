class Exhibit < ApplicationRecord
  has_many :artifacts, dependent: :destroy
end

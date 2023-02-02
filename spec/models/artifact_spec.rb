require 'rails_helper'

RSpec.describe Artifact, type: :model do
  it {should belong_to :exhibit}
end
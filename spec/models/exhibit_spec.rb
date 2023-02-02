require 'rails_helper'

RSpec.describe Exhibit, type: :model do
  it {should have_many :artifacts}
end

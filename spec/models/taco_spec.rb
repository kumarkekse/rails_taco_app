require 'rails_helper'

RSpec.describe Taco, type: :model do

  # ensure presence of meat
  it { should validate_presence_of(:meat) }

end
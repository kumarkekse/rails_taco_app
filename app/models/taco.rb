class Taco < ApplicationRecord

  # constants
  MEAT_TYPE = { :chicken => 'chicken', :steak => 'steak', :others => 'others' }

  validates :meat, presence: true, inclusion: { in: [ 'chicken', 'steak', 'others' ] }
end

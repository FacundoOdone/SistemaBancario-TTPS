class BranchOffice < ApplicationRecord
  belongs_to :schedule
  belongs_to :turn
  belongs_to :location
end

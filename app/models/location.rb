class Location < ApplicationRecord
  belongs_to :branch_office, optional: true
end

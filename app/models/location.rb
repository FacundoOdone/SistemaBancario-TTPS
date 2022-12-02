class Location < ApplicationRecord
  has_many :branch_office, foreign_key: true
end

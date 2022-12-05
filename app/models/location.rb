class Location < ApplicationRecord
  has_many :branch_office, foreign_key: true

  validates :name, presence: true
  validates :province, presence: true
end

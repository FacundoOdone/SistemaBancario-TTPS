class Location < ApplicationRecord
  has_many :branch_office, class_name: "BranchOffice", dependent: :destroy

  validates :name, presence: true
  validates :province, presence: true
end

class BranchOffice < ApplicationRecord
  belongs_to :schedule

  has_many :user, index: true, foreign_key: true
  has_many :turn, index: true, foreign_key: true  
  has_one :location, index: {unique: true}, foreign_key: true
  #Si es has_one, al index pongo index: {unique: true}
end

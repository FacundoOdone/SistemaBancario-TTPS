class BranchOffice < ApplicationRecord


  has_many :user, foreign_key: true
  has_many :turn, foreign_key: true  
  has_one :location, foreign_key: true
  has_one :schedule, foreign_key: true
  #Si es has_one, al index pongo index: {unique: true}
end

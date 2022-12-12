class BranchOffice < ApplicationRecord
  belongs_to :location
  belongs_to :schedule
  has_many :user, foreign_key: true
  has_many :turn, foreign_key: true  
  

  validates :name, presence: true
  validates :direc, presence: true
  validates :tel, presence: true
  validates :location_id, presence: true
  validates :schedule_id, presence: true
  #Si es has_one, al index pongo index: {unique: true}
end

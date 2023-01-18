class Turn < ApplicationRecord
  belongs_to :branch_office, optional: true

  belongs_to :user, optional: true

  validates :client, presence: true
  validates :branch_office, presence: true
  validates :date, presence: true 
  validates :hour, presence: true
  validates :state, presence: true, inclusion: [0,1]
  validates :reason, presence: true
end

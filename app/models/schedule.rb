class Schedule < ApplicationRecord

  has_one :branch_office, dependent: :destroy, foreign_key: true
  
  validates :open_hour_monday , presence: true
  validates :close_hour_monday,presence: true

  validates :open_hour_tuesday , presence: true
  validates :close_hour_tuesday,presence: true

  validates :open_hour_wednesday , presence: true
  validates :close_hour_wednesday,presence: true

  validates :open_hour_thursday , presence: true
  validates :close_hour_thursday,presence: true

  validates :open_hour_friday , presence: true
  validates :close_hour_friday,presence: true

  validates :open_hour_saturday , presence: true
  validates :close_hour_saturday,presence: true

end

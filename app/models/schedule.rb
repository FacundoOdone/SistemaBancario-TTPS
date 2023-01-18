class Schedule < ApplicationRecord

  has_one :branch_office, dependent: :destroy, foreign_key: true
  
  validates :monday_open_hour, presence:true, if: -> {monday_close_hour.present?}
  validates :monday_close_hour, presence:true, if: -> {monday_open_hour.present?}

  validates :tuesday_open_hour, presence:true, if: -> {tuesday_close_hour.present?}
  validates :tuesday_close_hour, presence:true, if: -> {tuesday_open_hour.present?}

  validates :wednesday_open_hour, presence:true, if: -> {wednesday_close_hour.present?}
  validates :wednesday_close_hour, presence:true, if: -> {wednesday_open_hour.present?}

  validates :thursday_open_hour, presence:true, if: -> {thursday_close_hour.present?}
  validates :thursday_close_hour, presence:true, if: -> {thursday_open_hour.present?}

  validates :friday_open_hour, presence:true, if: -> {friday_close_hour.present?}
  validates :friday_close_hour, presence:true, if: -> {friday_open_hour.present?}

  validates :saturday_open_hour, presence:true, if: -> {saturday_close_hour.present?}
  validates :saturday_close_hour, presence:true, if: -> {saturday_open_hour.present?}

  validates :sunday_open_hour, presence:true, if: -> {sunday_close_hour.present?}
  validates :sunday_close_hour, presence:true, if: -> {sunday_open_hour.present?}

end

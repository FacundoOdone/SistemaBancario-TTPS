class Schedule < ApplicationRecord

  has_one :branch_office, class_name: "BranchOffice", dependent: :destroy
  
  validates :open_hour_monday, presence:true, if: -> {close_hour_monday.present?}
  validates :close_hour_monday, presence:true, if: -> {open_hour_monday.present?}

  validates :open_hour_tuesday, presence:true, if: -> {close_hour_tuesday.present?}
  validates :close_hour_tuesday, presence:true, if: -> {open_hour_tuesday.present?}

  validates :open_hour_wednesday, presence:true, if: -> {close_hour_wednesday.present?}
  validates :close_hour_wednesday, presence:true, if: -> {open_hour_wednesday.present?}

  validates :open_hour_thursday, presence:true, if: -> {close_hour_thursday.present?}
  validates :close_hour_thursday, presence:true, if: -> {open_hour_thursday.present?}

  validates :open_hour_friday, presence:true, if: -> {close_hour_friday.present?}
  validates :close_hour_friday, presence:true, if: -> {open_hour_friday.present?}

  validates :open_hour_saturday, presence:true, if: -> {close_hour_saturday.present?}
  validates :close_hour_saturday, presence:true, if: -> {open_hour_saturday.present?}

  validates :open_hour_sunday, presence:true, if: -> {close_hour_sunday.present?}
  validates :close_hour_sunday, presence:true, if: -> {open_hour_sunday.present?}

end

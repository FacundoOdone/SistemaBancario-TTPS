class Schedule < ApplicationRecord

  has_one :branch_office, class_name: "BranchOffice", dependent: :destroy
  validates_associated :branch_office
  
  validates :open_hour_monday, presence:true, if: -> {close_hour_monday.present?}, comparison: { less_than: :close_hour_monday, message: "La hora de apertura del Lunes debe ser menor a la de cierre" }
  validates :close_hour_monday, presence:true, if: -> {open_hour_monday.present?}

  validates :open_hour_tuesday, presence:true, if: -> {close_hour_tuesday.present?}, comparison: { less_than: :close_hour_tuesday, message: "La hora de apertura del Martes debe ser menor a la de cierre" }
  validates :close_hour_tuesday, presence:true, if: -> {open_hour_tuesday.present?}

  validates :open_hour_wednesday, presence:true, if: -> {close_hour_wednesday.present?}, comparison: { less_than: :close_hour_wednesday, message: "La hora de apertura del Miercoles debe ser menor a la de cierre" }
  validates :close_hour_wednesday, presence:true, if: -> {open_hour_wednesday.present?}

  validates :open_hour_thursday, presence:true, if: -> {close_hour_thursday.present?}, comparison: { less_than: :close_hour_thursday, message: "La hora de apertura del Jueves debe ser menor a la de cierre" }
  validates :close_hour_thursday, presence:true, if: -> {open_hour_thursday.present?}

  validates :open_hour_friday, presence:true, if: -> {close_hour_friday.present?}, comparison: { less_than: :close_hour_friday, message: "La hora de apertura del Viernes debe ser menor a la de cierre" }
  validates :close_hour_friday, presence:true, if: -> {open_hour_friday.present?}

  validates :open_hour_saturday, presence:true, if: -> {close_hour_saturday.present?}, comparison: { less_than: :close_hour_saturday, message: "La hora de apertura del Sabado debe ser menor a la de cierre" }
  validates :close_hour_saturday, presence:true, if: -> {open_hour_saturday.present?}

  validates :open_hour_sunday, presence:true, if: -> {close_hour_sunday.present?}, comparison: { less_than: :close_hour_sunday, message: "La hora de apertura del Domingo debe ser menor a la de cierre" }
  validates :close_hour_sunday, presence:true, if: -> {open_hour_sunday.present?}


  

end

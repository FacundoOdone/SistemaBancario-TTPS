class Schedule < ApplicationRecord

  has_one :branch_office, dependent: :destroy, foreign_key: true
  
end

class Schedule < ApplicationRecord

  has_one :branch_office, index: {unique: true}, foreign_key: true
  
end

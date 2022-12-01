class Turn < ApplicationRecord
  belong_to :branch_office, optional: true

  has_one :user, index: {unique: true}, foreign_key: true
end

class Turn < ApplicationRecord
  belong_to :branch_office, optional: true

  belong_to :user, optional: true
end

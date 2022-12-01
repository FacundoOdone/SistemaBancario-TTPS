class Addreferences < ActiveRecord::Migration[7.0]
  def change

    add_reference :branch_offices, :turns, index: true, foreign_key: true
    add_reference :branch_offices, :location, index: {unique: true}, foreign_key: true
    add_reference :branch_offices, :users, index: true, foreign_key: true

    add_reference :turns, :users, index: {unique: true}, foreign_key: true

    add_reference :schedules, :branch_offices, index: {unique: true}, foreign_key: true

  end
end

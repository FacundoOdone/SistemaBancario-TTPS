class Addreferences < ActiveRecord::Migration[7.0]
  def change

    add_reference :turns, :branch_offices, index: true, foreign_key: true
    add_reference :turns, :users, index: {unique: true}, foreign_key: true

    add_reference :users, :branch_offices , index: true, foreign_key: true

    
    add_reference :branch_offices, :location, index: true, foreign_key: true
    
    add_reference :branch_offices, :schedules,  index: {unique: true}, foreign_key: true
    rename_column :branch_offices, :schedules_id, :schedule_id

  end
end

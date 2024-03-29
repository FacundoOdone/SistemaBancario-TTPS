class Addreferences < ActiveRecord::Migration[7.0]
  def change

    add_reference :turns, :branch_offices, index: true, foreign_key: true, null: false
    rename_column :turns, :branch_offices_id, :branch_office_id 

    add_reference :turns, :client, index: true, foreign_key: {to_table: "users"}, null: false

    add_reference :turns, :users, index: true, foreign_key: true, null: true
    rename_column :turns, :users_id, :staff_attended_id



    add_reference :users, :branch_offices , index: true, foreign_key: true, null: true
    rename_column :users, :branch_offices_id, :branch_office_id 
    


    add_reference :branch_offices, :location, index: true, foreign_key: true
    
    add_reference :branch_offices, :schedules,  index: {unique: true}, foreign_key: true
    rename_column :branch_offices, :schedules_id, :schedule_id

    


  end
end

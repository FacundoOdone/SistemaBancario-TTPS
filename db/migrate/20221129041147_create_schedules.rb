class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      
      t.time :open_hour_monday
      t.time :close_hour_monday

      t.time :open_hour_tuesday
      t.time :close_hour_tuesday

      t.time :open_hour_wednesday
      t.time :close_hour_wednesday

      t.time :open_hour_thursday
      t.time :close_hour_thursday

      t.time :open_hour_friday
      t.time :close_hour_friday

      t.time :open_hour_saturday
      t.time :close_hour_saturday

      t.time :open_hour_sunday
      t.time :close_hour_sunday

      t.timestamps
    end
  end
end

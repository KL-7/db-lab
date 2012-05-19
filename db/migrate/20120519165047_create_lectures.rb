class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.references :course
      t.references :auditorium
      t.time :start_time
      t.time :end_time
      t.string :weekday
    end
  end

  def self.down
    drop_table :lectures
  end
end

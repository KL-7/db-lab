class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.references :lecturer
      t.references :subject
      t.integer :hours_per_week
      t.integer :students_number
    end
  end

  def self.down
    drop_table :courses
  end
end

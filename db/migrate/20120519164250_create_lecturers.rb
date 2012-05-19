class CreateLecturers < ActiveRecord::Migration
  def self.up
    create_table :lecturers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
    end
  end

  def self.down
    drop_table :lecturers
  end
end

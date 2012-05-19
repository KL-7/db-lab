class CreateAuditoriumTypes < ActiveRecord::Migration
  def self.up
    create_table :auditorium_types do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :auditorium_types
  end
end

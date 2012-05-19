class CreateAuditoria < ActiveRecord::Migration
  def self.up
    create_table :auditoria do |t|
      t.integer :auditorium_number
      t.integer :seats_number
      t.integer :building_number
      t.references :auditorium_type
    end
  end

  def self.down
    drop_table :auditoria
  end
end

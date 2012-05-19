class Auditorium < ActiveRecord::Base
  belongs_to :auditorium_type
  attr_accessible :auditorium_number, :seats_number, :building_number, :auditorium_type_id
  delegate :name, :to => :auditorium_type, :prefix => true
end

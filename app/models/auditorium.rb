class Auditorium < ActiveRecord::Base
  belongs_to :auditorium_type

  attr_accessible :auditorium_number, :seats_number, :building_number, :auditorium_type_id

  validates :auditorium_type,   :presence => true
  validates :auditorium_number, :presence => true, :numericality => true
  validates :seats_number,      :presence => true, :numericality => true
  validates :building_number,   :presence => true, :numericality => true

  delegate :name, :to => :auditorium_type, :prefix => true

  def name
    "##{auditorium_number} (#{auditorium_type_name})"
  end
end

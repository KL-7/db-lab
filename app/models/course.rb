class Course < ActiveRecord::Base
  belongs_to :lecturer
  belongs_to :subject

  attr_accessible :lecturer_id, :subject_id, :hours_per_week, :students_number

  validates :lecturer,        :presence => true
  validates :subject,         :presence => true
  validates :hours_per_week,  :presence => true, :numericality => true
  validates :students_number, :presence => true, :numericality => true

  delegate :full_name, :to => :lecturer, :prefix => true
  delegate :name, :to => :subject, :prefix => true

  def name
    "#{subject_name} (by #{lecturer_full_name})"
  end
end

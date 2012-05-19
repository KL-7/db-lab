class Lecture < ActiveRecord::Base
  belongs_to :course
  belongs_to :auditorium

  attr_accessible :course_id, :auditorium_id, :start_time, :end_time, :weekday

  WEEKDAYS = %w[Mo Tu We Th Fr Sa Su]

  validates :course,     :presence => true
  validates :auditorium, :presence => true
  validates :start_time, :presence => true
  validates :end_time,   :presence => true
  validates :weekday,    :presence => true, :inclusion => { :in => WEEKDAYS }

  delegate :name, :to => :course, :prefix => true
  delegate :name, :to => :auditorium, :prefix => true
end

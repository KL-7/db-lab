class Lecturer < ActiveRecord::Base
  attr_accessible :first_name, :middle_name, :last_name

  validates :first_name,  :presence => true
  validates :middle_name, :presence => true
  validates :last_name,   :presence => true

  def full_name
    [first_name, middle_name, last_name].compact.join(' ')
  end
end

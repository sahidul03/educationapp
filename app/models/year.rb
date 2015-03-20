class Year < ActiveRecord::Base

  belongs_to :level
  has_many :semesters

end

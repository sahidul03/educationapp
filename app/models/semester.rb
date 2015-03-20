class Semester < ActiveRecord::Base

  belongs_to :year
  has_many :shifts

end

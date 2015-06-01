class Level < ActiveRecord::Base

  #Level means class
  has_many :years
  has_many :students

end

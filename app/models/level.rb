class Level < ActiveRecord::Base

  validates :name, :uniqueness => { :case_sensitive => false }
  #Level means class
  has_many :years
  has_many :students
  has_many :fees

end

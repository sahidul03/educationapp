class Month < ActiveRecord::Base
  validates :name, :uniqueness => { :case_sensitive => false }
  has_many :fees
end

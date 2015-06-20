class AccountYear < ActiveRecord::Base
  validates :name, :uniqueness => { :case_sensitive => false }
  validates :name, presence: true
  has_many :fees

end

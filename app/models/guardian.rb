class Guardian < ActiveRecord::Base
  belongs_to :user
  has_one :student
end

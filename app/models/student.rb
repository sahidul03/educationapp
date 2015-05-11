class Student < ActiveRecord::Base
  belongs_to :user
  belongs_to :guardian
  belongs_to :campus
  has_and_belongs_to_many :shifts
end

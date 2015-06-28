class Student < ActiveRecord::Base
  mount_uploader :profilepic, ProfilepicUploader
  mount_uploader :coverpic, ProfilepicUploader
  belongs_to :user
  belongs_to :guardian
  belongs_to :campus
  has_and_belongs_to_many :shifts
  belongs_to :level
  has_one :student_fee, :dependent => :destroy
  has_many :student_pay_reports, :dependent => :destroy
end

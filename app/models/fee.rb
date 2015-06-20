class Fee < ActiveRecord::Base
  belongs_to :level
  belongs_to :month
  belongs_to :account_year
  has_many :additional_fees

  validates :level_id, :month_id, :account_year_id, presence: true
  validates :monthly_fee, :session_fee, :ict_fee, :admission_fee,:exam_fee, :others, numericality: {greater_than_or_equal_to: 0}
end

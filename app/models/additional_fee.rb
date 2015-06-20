class AdditionalFee < ActiveRecord::Base
  belongs_to :fee
  validates :name, presence:true
end

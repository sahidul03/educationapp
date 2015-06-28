class AddLastDateFeeToFees < ActiveRecord::Migration
  def change
    add_column :fees, :last_date_fee, :date
  end
end

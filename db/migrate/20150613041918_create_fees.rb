class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.references :level, index: true
      t.references :month, index: true
      t.references :account_year, index: true
      t.integer :monthly_fee, :default=> 0
      t.integer :session_fee, :default=> 0
      t.integer :admission_fee, :default=> 0
      t.integer :ict_fee, :default=> 0
      t.integer :exam_fee, :default=> 0
      t.integer :others, :default=> 0
      t.string :comment

      t.timestamps
    end
  end
end

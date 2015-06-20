class CreateAdditionalFees < ActiveRecord::Migration
  def change
    create_table :additional_fees do |t|
      t.references :fee, index:true
      t.string :name
      t.integer :amount, :default=> 0

      t.timestamps
    end
  end
end

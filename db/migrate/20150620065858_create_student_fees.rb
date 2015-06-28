class CreateStudentFees < ActiveRecord::Migration
  def change
    create_table :student_fees do |t|
      t.references :student, index: true
      t.integer :advance, :default=> 0
      t.integer :due, :default=> 0
      t.integer :total_paid, :default=> 0
      t.boolean :payment_status, :default=> false

      t.timestamps
    end
  end
end

class CreateStudentPayReports < ActiveRecord::Migration
  def change
    create_table :student_pay_reports do |t|
      t.references :student, index: true
      t.integer :amount

      t.timestamps
    end
  end
end

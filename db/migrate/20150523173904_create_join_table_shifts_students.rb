class CreateJoinTableShiftsStudents < ActiveRecord::Migration
  def change
    create_table :shifts_students do |t|
      t.references :shift, index: true
      t.references :student, index: true
    end
  end
end

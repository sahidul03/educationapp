class CreateShiftStudent < ActiveRecord::Migration
  def change
    create_table :shift_students do |t|
      t.references :shift, index: true
      t.references :student, index: true
    end
  end
end

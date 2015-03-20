class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|

      t.string :name

      t.references :semester, index: true

      t.timestamps
    end
  end
end

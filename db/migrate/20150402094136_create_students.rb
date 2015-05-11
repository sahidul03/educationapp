class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|

      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :mother_name
      t.string :local_guardian
      t.string :relationship_with_guardian
      t.string :gender
      t.integer :contact_number

      t.references :user, index: true
      t.references :guardian, index: true
      t.references :campus, index: true

      t.timestamps
    end
  end
end

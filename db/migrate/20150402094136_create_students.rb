class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|

      t.string :father_name
      t.string :mother_name
      t.string :local_guardian
      t.string :relationship_with_guardian
      t.string :gender

      t.references :user, index: true
      t.references :guardian, index: true

      t.timestamps
    end
  end
end

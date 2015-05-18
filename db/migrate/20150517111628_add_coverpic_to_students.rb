class AddCoverpicToStudents < ActiveRecord::Migration
  def change
    add_column :students, :coverpic, :string
  end
end

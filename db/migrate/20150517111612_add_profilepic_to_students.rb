class AddProfilepicToStudents < ActiveRecord::Migration
  def change
    add_column :students, :profilepic, :string
  end
end

class AddLevelToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :level, index: true
  end
end

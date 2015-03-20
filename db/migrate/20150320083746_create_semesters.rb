class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|

      t.string :name

      t.references :year, index: true

      t.timestamps
    end
  end
end

class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|

      t.string :name

      t.references :level, index: true

      t.timestamps
    end
  end
end

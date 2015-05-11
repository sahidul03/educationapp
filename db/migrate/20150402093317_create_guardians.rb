class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|

      t.string :name
      t.integer :contact_number
      t.references :user, index: true

      t.timestamps
    end
  end
end

class CreateAccountYears < ActiveRecord::Migration
  def change
    create_table :account_years do |t|
      t.string :name

      t.timestamps
    end
  end
end

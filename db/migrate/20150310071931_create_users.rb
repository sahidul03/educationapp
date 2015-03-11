class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      # t.string :name
      t.string :user_name
      # t.string :email
      t.integer :user_flag

      t.timestamps
    end
  end
end

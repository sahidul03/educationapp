class CreateShiftsUsers < ActiveRecord::Migration
  def change
    create_table :shifts_users do |t|
      t.belongs_to :shift,  index: true
      t.belongs_to :user,  index: true
    end
  end
end

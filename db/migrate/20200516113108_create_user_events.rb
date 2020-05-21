class CreateUserEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :user_events do |t|
      t.references :user
      t.references :event
      t.float :paid_amount
      t.datetime :booking_date

      t.timestamps
    end
  end
end

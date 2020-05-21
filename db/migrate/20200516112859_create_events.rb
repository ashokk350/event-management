class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :user
      t.string :title
      t.string :event_type
      t.string :status
      t.text :description
      t.float :cost
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

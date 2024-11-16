class CreateAttendedEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :attended_events do |t|
      t.references :attendee, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end

    add_index :attended_events, [:attendee_id, :event_id], unique: true
  end
end

class RemoveAttendeeFromEvents < ActiveRecord::Migration[8.0]
  def change
    remove_column :events, :attendee_id, :integer
  end
end
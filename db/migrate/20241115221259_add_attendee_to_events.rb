class AddAttendeeToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :attendee_id, :integer
  end
end

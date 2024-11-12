class DropEventsTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :events
  end
end

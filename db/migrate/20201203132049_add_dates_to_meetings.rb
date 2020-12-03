class AddDatesToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :start_time, :datetime
    add_column :meetings, :end_time, :datetime
  end
end

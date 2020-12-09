class AddActivityAddressToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :activity_address, :string, default: nil
  end
end

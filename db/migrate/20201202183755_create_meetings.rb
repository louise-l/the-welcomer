class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.date :date_in
      t.date :date_out
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

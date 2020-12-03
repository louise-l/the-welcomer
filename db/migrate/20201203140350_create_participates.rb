class CreateParticipates < ActiveRecord::Migration[6.0]
  def change
    create_table :participates do |t|
      t.references :meeting, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

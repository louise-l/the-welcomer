class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.string :description
      t.string :status, default: 'Not mastered'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

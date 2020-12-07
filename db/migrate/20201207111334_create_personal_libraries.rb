class CreatePersonalLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_libraries do |t|
      t.string :label
      t.string :status, default: 'Not read'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

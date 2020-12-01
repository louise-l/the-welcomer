class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :job, :string
    add_column :users, :role, :string
    add_column :users, :description, :text
  end
end

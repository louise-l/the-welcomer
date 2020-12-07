class AddArrivalDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :arrival_date, :date
  end
end

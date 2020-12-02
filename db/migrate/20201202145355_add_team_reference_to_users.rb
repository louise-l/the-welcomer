class AddTeamReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :team, foreign_key: true
  end
end

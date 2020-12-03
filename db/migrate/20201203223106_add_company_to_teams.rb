class AddCompanyToTeams < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :company, null: false, foreign_key: true
  end
end

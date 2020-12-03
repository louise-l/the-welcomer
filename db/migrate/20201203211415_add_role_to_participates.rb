class AddRoleToParticipates < ActiveRecord::Migration[6.0]
  def change
    add_column :participates, :owner, :boolean
  end
end

class AddLabelToLibraries < ActiveRecord::Migration[6.0]
  def change
    add_column :libraries, :label, :string
  end
end

class AddFiltersToThing < ActiveRecord::Migration[5.0]
  def change
    add_column :things, :filters, :string
  end
end

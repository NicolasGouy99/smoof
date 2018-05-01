class CreateTotos < ActiveRecord::Migration[5.0]
  def change
    create_table :totos do |t|

      t.timestamps
    end
  end
end

class UpdatePropertyTable < ActiveRecord::Migration
  def change
    change_table :properties do |t|
      t.rename :price_unit, :dimensions_unit
      t.remove :price
      t.column :price_cents, :integer, :default => 0
    end
  end
end

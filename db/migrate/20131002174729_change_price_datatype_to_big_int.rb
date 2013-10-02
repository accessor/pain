class ChangePriceDatatypeToBigInt < ActiveRecord::Migration
  def change
    change_table :properties do |t|
      t.change :price_cents, :integer, :limit => 8
      t.index :type
      t.index :price_cents
    end
  end
end

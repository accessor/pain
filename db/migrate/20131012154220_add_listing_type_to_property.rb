class AddListingTypeToProperty < ActiveRecord::Migration
  def change
    change_table :properties do |t|
      t.column :listing_type, :string, :limit => 20
      t.remove :address_id
      t.remove :image_id
      t.integer :maintenance_charge_cents, :integer, :limit => 8, :default => 0
      t.column :listing_by, :string, :limit => 20
    end
  end
end

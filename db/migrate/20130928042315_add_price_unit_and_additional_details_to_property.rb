class AddPriceUnitAndAdditionalDetailsToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :price_unit, :string
    add_column :properties, :additional_details, :text
  end
end

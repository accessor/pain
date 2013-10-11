class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :code
      t.string :status, :default => 'active'
      t.string :area
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode

      t.timestamps
    end
  end
end

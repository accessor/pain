class AddLatAndLngToAddress < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.column :latitude,  :float
      t.column :longitude, :float
      t.column :gmaps, :boolean
      t.column :area, :string
    end
  end
end

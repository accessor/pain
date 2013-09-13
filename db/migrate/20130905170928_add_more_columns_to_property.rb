class AddMoreColumnsToProperty < ActiveRecord::Migration
  def change
  	add_column :properties, :status, :string
  	add_column :properties, :expiry_time, :datetime
  	add_column :properties, :post_by, :string
  end
end

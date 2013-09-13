class AddPropertyToAssociatedTables < ActiveRecord::Migration
  def change
    execute "ALTER TABLE properties ADD COLUMN address_id int, ADD COLUMN image_id int, ADD COLUMN user_id int;"
  end
end

class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :code
      t.string :type
      t.string :title
      t.text :description
      t.string :dimensions
      t.string :price

      t.timestamps
    end
  end
end

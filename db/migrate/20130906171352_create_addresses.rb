class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :mobile
      t.string :landline

      t.timestamps
    end
  end
end

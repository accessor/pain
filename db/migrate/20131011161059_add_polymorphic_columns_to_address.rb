class AddPolymorphicColumnsToAddress < ActiveRecord::Migration
  def change
    change_table :addresses do |t|
      t.references :addressable, :polymorphic => true
    end
  end
end

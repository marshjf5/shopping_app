class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.string :name
      t.integer :supplier_id
      t.float :package_price

      t.timestamps
    end
  end

  def self.down
    drop_table :packages
  end
end

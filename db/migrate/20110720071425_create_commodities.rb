class CreateCommodities < ActiveRecord::Migration
  def self.up
    create_table :commodities do |t|
      t.string :name
      t.integer :amount
      t.float :price
      t.integer :supplier_id
      t.timestamps
    end
  end

  def self.down
    drop_table :commodities
  end
end

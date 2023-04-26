class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string     :title, null: false, index: { unique: true }
      t.string     :sku, index: { unique: true }
      t.string     :barcode, index: { unique: true }
      t.integer    :in_stock, default: 0

      t.timestamps
    end
  end
end

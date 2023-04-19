class CreateCounterparties < ActiveRecord::Migration[7.0]
  def change
    create_table :counterparties do |t|
      t.string :name, null: false
      t.string :phone, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

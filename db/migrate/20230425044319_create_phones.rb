class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :value, null: false, index:{ unique: true }
      t.references :counterparty, null: false, foreign_key: true

      t.timestamps
    end
  end
end

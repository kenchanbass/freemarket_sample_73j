class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.integer :size_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :postage_payer_id, null: false
      t.integer :preparation_day_id, null: false
      t.integer :postage_type_id, null: false
      t.integer :brand_id
      t.integer :prefecture_code, null: false
      t.integer :trading_status, default: 0, null: false, limit: 1
      t.references :category, foreign_key: true
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :seller, foreign_key: { to_table: :users }, null: false

      t.timestamp :deal_closed_date
      t.timestamps
    end
  end
end

class CreateSpendingDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :spending_details do |t|
      t.references :user
      t.references :account_book
      t.string :type
      t.string :description
      t.integer :price
      t.datetime :date
    end
  end
end

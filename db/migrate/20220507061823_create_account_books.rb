class CreateAccountBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :account_books do |t|
      t.references :user
      t.string :month
      t.string :total_result
      t.integer :total_earning
      t.integer :total_food
      t.integer :total_shopping
      t.integer :total_culture
      t.integer :total_education
  
      t.timestamps
    end
  end
end

class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name, null: false
      t.string :phone_number
      t.integer :customer_rating

      t.timestamps null: false
    end
  end
end

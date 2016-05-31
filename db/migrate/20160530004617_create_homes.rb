class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :price, null: false
      t.integer :square_feet
      t.string :bathroom
      t.string :room
      t.string :year_built
      t.boolean :sold
      t.belongs_to :seller

      t.timestamps null: false
    end
  end
end

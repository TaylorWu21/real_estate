	class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.belongs_to :home

      t.timestamps null: false
    end
  end
end

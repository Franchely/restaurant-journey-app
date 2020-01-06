class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :borough
      t.string :violation
      t.string :code
      t.string :cuisine
      t.integer :score

      t.timestamps
    end
  end
end

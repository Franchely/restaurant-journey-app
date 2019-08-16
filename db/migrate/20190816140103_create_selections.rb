class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :restaurant, foreign_key: true
      t.integer :score
      t.string :fate

      t.timestamps
    end
  end
end

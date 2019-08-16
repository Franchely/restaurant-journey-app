class AddScoreToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :score, :integer
  end
end

class DropHealthFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :health 
  end
end

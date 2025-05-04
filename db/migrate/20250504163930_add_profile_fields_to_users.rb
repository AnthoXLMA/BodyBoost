class AddProfileFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
  end
end

class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.integer :proteins
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

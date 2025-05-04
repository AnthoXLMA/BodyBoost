class CreateMealItems < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_items do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end

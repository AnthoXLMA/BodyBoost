class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.float :quantity
      t.integer :calories
      t.float :proteins
      t.date :date

      t.timestamps
    end
  end
end

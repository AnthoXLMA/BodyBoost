class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :duration
      t.integer :calories
      t.date :date

      t.timestamps
    end
  end
end

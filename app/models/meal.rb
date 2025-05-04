class Meal < ApplicationRecord
  belongs_to :user
has_many :meal_items
has_many :foods, through: :meal_items

end

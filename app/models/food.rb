class Food < ApplicationRecord
  belongs_to :category
has_many :meal_items

end

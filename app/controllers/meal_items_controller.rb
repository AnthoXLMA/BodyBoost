class MealItemsController < ApplicationController
  def create
    meal = current_user.meals.find_or_create_by(date: Date.today)

    meal_item = meal.meal_items.build(
      food_id: params[:food_id],
      quantity: params[:quantity]
    )

    if meal_item.save
      redirect_to foods_path, notice: "Aliment ajouté au repas !"
    else
      redirect_to foods_path, alert: "Erreur lors de l'ajout."
    end
  end
end

class DashboardController < ApplicationController
  before_action :require_login

  def show
    today = Date.today
    @user = current_user
    @activities = current_user.activities.where(date: today)
    @meals = current_user.meals.where(date: today)

    @total_calories_burned = @activities.sum(:calories)
    @total_calories_consumed = @meals.sum(:calories)
    @total_proteins = @meals.sum(:proteins)

    #Calcul des totaux dans le dashboard
    today_meal = @user.meals.find_by(date: Date.today)

    @total_calories = today_meal&.meal_items&.sum { |item| (item.food.calories * item.quantity / 100.0).round } || 0
    @total_proteins = today_meal&.meal_items&.sum { |item| (item.food.proteins * item.quantity / 100.0).round(1) } || 0
  end

  private

  def require_login
    unless current_user
      redirect_to login_path, alert: "Vous devez être connecté pour accéder au tableau de bord."
    end
  end


end

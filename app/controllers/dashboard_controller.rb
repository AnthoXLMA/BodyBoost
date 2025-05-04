class DashboardController < ApplicationController
  before_action :require_login

  def show
    today = Date.today
    @activities = current_user.activities.where(date: today)
    @meals = current_user.meals.where(date: today)

    @total_calories_burned = @activities.sum(:calories)
    @total_calories_consumed = @meals.sum(:calories)
    @total_proteins = @meals.sum(:proteins)
  end
end
